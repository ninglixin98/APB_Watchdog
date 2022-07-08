
import re
import csv
import os
#from rkvRgmItem import RgmItem

class RgmItem:
    '''
    classdocs
    '''
    def __init__(self):
        '''
        Constructor
        '''
        self._properties = {'register':''
                            ,'address':'0x00'
                            ,'fields':[]
                            }

class GenRgm:
    '''
    classdocs
    '''
    def __init__(self):
        '''
        Constructor
        '''
        self._rgmItemList = []
        self._curRegName = ''
        self._uvmFileName = 'rkv_watchdog_reg.sv'
        self._cFileName = 'rkv_watchdog_reg.h'


    # Excel/CSV format file read/write methods
    def readRgmFile(self, filename):
        "read register file and update the internal database"
        rgmFile = open(filename, 'r')
        self._rgmFileName = filename
        reader = csv.DictReader(rgmFile)
        for infos in reader:
            self._readRgmInfos(infos)

    def _readRgmInfos(self, infos):
        """extract register information from string line
           and return it as a dictionary
        """
        if(infos['register'] != ''):
            rgmObj = RgmItem()
            self._curRegName = infos['register']
            rgmObj._properties['register'] = infos['register']
            rgmObj._properties['address'] = infos['address']
            rgmObj._properties['reg_access'] = infos['reg_access']
            self._rgmItemList.append(rgmObj)
        fieldInfos = self._readFieldInfos(infos)
        self._rgmItemList[-1]._properties['fields'].append(fieldInfos)


    def _readFieldInfos(self, infos):
        fieldInfos = {}
        fieldInfos['field'] = infos['field']
        fieldInfos['field_access'] = infos['field_access']
        fieldInfos['reset_value'] = infos['reset_value']
        fieldInfos['bitpos_end'] = infos['bitpos_end']
        fieldInfos['bitpos_start'] = infos['bitpos_start']
        fieldInfos['function'] = infos['function']
        return fieldInfos


    def genUVMFile(self):
        with open(self._uvmFileName, 'w') as uvmFile:

            def _writeUVMHeader():
                #uvmFile.write('package rkv_watchdog_reg;\n')
                uvmFile.write('  import uvm_pkg::*;\n')
                uvmFile.write('  `include "uvm_macros.svh"\n')
            def _writeRegClass(rgmObj):
                uvmFile.write('  class %s_reg extends uvm_reg;\n' % rgmObj._properties['register'])
                uvmFile.write('    `uvm_object_utils(%s_reg)\n' % rgmObj._properties['register'])
                for fd in rgmObj._properties['fields']:
                    uvmFile.write('    rand uvm_reg_field %s;\n' % fd['field'])
                uvmFile.write('    covergroup value_cg;\n')
                uvmFile.write('      option.per_instance = 1;\n')
                for fd in rgmObj._properties['fields']:
                    uvmFile.write('      %s: coverpoint %s.value[%s:%s];\n' % (fd['field'],fd['field'],fd['bitpos_end'],fd['bitpos_start']))
                uvmFile.write('    endgroup\n')
                uvmFile.write('\
    function new(string name = "%s_reg");\n\
      super.new(name, 32, UVM_CVR_ALL);\n\
      void\'(set_coverage(UVM_CVR_FIELD_VALS));\n\
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin\n\
        value_cg = new();\n\
      end\n\
    endfunction\n' % rgmObj._properties['register'])
                uvmFile.write('    virtual function void build();\n')
                for fd in rgmObj._properties['fields']:
                    uvmFile.write('      %s = uvm_reg_field::type_id::create("%s");\n' % (fd['field'], fd['field']))
                for fd in rgmObj._properties['fields']:
                    uvmFile.write('      %s.configure(this, %0d, %s, "%s", 0, \'h%s, 1, 0, 0);\n' % (fd['field'], int(fd['bitpos_end'])-int(fd['bitpos_start'])+1, fd['bitpos_start'], fd['field_access'], fd['reset_value'].replace('0x','')))
                uvmFile.write('    endfunction\n')
                uvmFile.write('\
    function void sample(\n\
      uvm_reg_data_t data,\n\
      uvm_reg_data_t byte_en,\n\
      bit            is_read,\n\
      uvm_reg_map    map\n\
    );\n\
      super.sample(data, byte_en, is_read, map);\n\
      sample_values(); \n\
    endfunction\n\
    function void sample_values();\n\
      super.sample_values();\n\
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin\n\
        value_cg.sample();\n\
      end\n\
    endfunction\n\
  endclass\n\n')
            def _writeRgmClass():
                uvmFile.write('  class rkv_watchdog_rgm extends uvm_reg_block;\n')
                uvmFile.write('    `uvm_object_utils(rkv_watchdog_rgm)\n')
                for rg in self._rgmItemList:
                    uvmFile.write('    rand %s_reg %s;\n' % (rg._properties['register'], rg._properties['register']))
                uvmFile.write('\
    uvm_reg_map map;\n\
    function new(string name = "rkv_watchdog_rgm");\n\
      super.new(name, UVM_NO_COVERAGE);\n\
    endfunction\n\
    virtual function void build();\n')
                for rg in self._rgmItemList:
                    uvmFile.write('      %s = %s_reg::type_id::create("%s");\n' % (rg._properties['register'], rg._properties['register'], rg._properties['register']))
                    uvmFile.write('      %s.configure(this);\n' % rg._properties['register'])
                    uvmFile.write('      %s.build();\n' % rg._properties['register'])
                uvmFile.write('      map = create_map("map", \'h0, 4, UVM_LITTLE_ENDIAN);\n')
                for rg in self._rgmItemList:
                    uvmFile.write('      map.add_reg(%s, 32\'h%s, "%s");\n' % (rg._properties['register'], rg._properties['address'].replace('0x',''), rg._properties['reg_access']))
                for rg in self._rgmItemList:
                    uvmFile.write('      //%s.add_hdl_path_slice("???", 0, 32);\n' % rg._properties['register'])
                uvmFile.write('      //add_hdl_path("???");\n')
                uvmFile.write('      lock_model();\n')
                uvmFile.write('    endfunction\n')
                uvmFile.write('  endclass\n\n')
                #uvmFile.write('endpackage\n')

            #genUVMFile main function below
            _writeUVMHeader()
            for rgmObj in self._rgmItemList:
                _writeRegClass(rgmObj)
            _writeRgmClass()

    def genCFile(self):
        pass



if __name__ == '__main__' :

    moduleTestList = []

    #[Test] clock file read
    def testReadRgmFile():
        print('%s \n[testReadClockFile] started \n%s\n' % (40*'*', 40*'*'))
        gen = GenRgm()
        gen.readRgmFile('rkv_watchdog_reg.csv')
        print('%s \n[testReadClockFile] PASSED \n%s\n' % (40*'*', 40*'*'))
    moduleTestList.append(testReadRgmFile)


    def testGenUVMRgm():
        print('%s \n[testReadClockFile] started \n%s\n' % (40*'*', 40*'*'))
        gen = GenRgm()
        gen.readRgmFile('rkv_watchdog_reg.csv')
        gen.genUVMFile()
        print('%s \n[testReadClockFile] PASSED \n%s\n' % (40*'*', 40*'*'))
    moduleTestList.append(testReadRgmFile)

    #testReadRgmFile()
    testGenUVMRgm()


