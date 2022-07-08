  import uvm_pkg::*;
  `include "uvm_macros.svh"
  class WDOGLOAD_reg extends uvm_reg;
    `uvm_object_utils(WDOGLOAD_reg)
    rand uvm_reg_field LOADVAL;
    covergroup value_cg;
      option.per_instance = 1;
      LOADVAL: coverpoint LOADVAL.value[31:0];
    endgroup
    function new(string name = "WDOGLOAD_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      LOADVAL = uvm_reg_field::type_id::create("LOADVAL");
      LOADVAL.configure(this, 32, 0, "RW", 0, 'hFFFFFFFF, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGVALUE_reg extends uvm_reg;
    `uvm_object_utils(WDOGVALUE_reg)
    rand uvm_reg_field CURVAL;
    covergroup value_cg;
      option.per_instance = 1;
      CURVAL: coverpoint CURVAL.value[31:0];
    endgroup
    function new(string name = "WDOGVALUE_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      CURVAL = uvm_reg_field::type_id::create("CURVAL");
      CURVAL.configure(this, 32, 0, "RO", 0, 'hFFFFFFFF, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGCONTROL_reg extends uvm_reg;
    `uvm_object_utils(WDOGCONTROL_reg)
    rand uvm_reg_field RESEN;
    rand uvm_reg_field INTEN;
    covergroup value_cg;
      option.per_instance = 1;
      RESEN: coverpoint RESEN.value[1:1];
      INTEN: coverpoint INTEN.value[0:0];
    endgroup
    function new(string name = "WDOGCONTROL_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      RESEN = uvm_reg_field::type_id::create("RESEN");
      INTEN = uvm_reg_field::type_id::create("INTEN");
      RESEN.configure(this, 1, 1, "RW", 0, 'h0, 1, 0, 0);
      INTEN.configure(this, 1, 0, "RW", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGINTCLR_reg extends uvm_reg;
    `uvm_object_utils(WDOGINTCLR_reg)
    rand uvm_reg_field INTCLR;
    covergroup value_cg;
      option.per_instance = 1;
      INTCLR: coverpoint INTCLR.value[0:0];
    endgroup
    function new(string name = "WDOGINTCLR_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      INTCLR = uvm_reg_field::type_id::create("INTCLR");
      INTCLR.configure(this, 1, 0, "WO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGRIS_reg extends uvm_reg;
    `uvm_object_utils(WDOGRIS_reg)
    rand uvm_reg_field RAWINT;
    covergroup value_cg;
      option.per_instance = 1;
      RAWINT: coverpoint RAWINT.value[0:0];
    endgroup
    function new(string name = "WDOGRIS_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      RAWINT = uvm_reg_field::type_id::create("RAWINT");
      RAWINT.configure(this, 1, 0, "RO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGMIS_reg extends uvm_reg;
    `uvm_object_utils(WDOGMIS_reg)
    rand uvm_reg_field INT;
    covergroup value_cg;
      option.per_instance = 1;
      INT: coverpoint INT.value[0:0];
    endgroup
    function new(string name = "WDOGMIS_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      INT = uvm_reg_field::type_id::create("INT");
      INT.configure(this, 1, 0, "RO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGLOCK_reg extends uvm_reg;
    `uvm_object_utils(WDOGLOCK_reg)
    rand uvm_reg_field WREN;
    rand uvm_reg_field WRACC;
    covergroup value_cg;
      option.per_instance = 1;
      WREN: coverpoint WREN.value[31:1];
      WRACC: coverpoint WRACC.value[0:0];
    endgroup
    function new(string name = "WDOGLOCK_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      WREN = uvm_reg_field::type_id::create("WREN");
      WREN.configure(this, 31, 1, "RW", 0, 'h00000000, 1, 0, 0);
      WRACC = uvm_reg_field::type_id::create("WRACC");
      WRACC.configure(this, 1, 0, "RW", 0, 'h00000000, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGITCR_reg extends uvm_reg;
    `uvm_object_utils(WDOGITCR_reg)
    rand uvm_reg_field ITME;
    covergroup value_cg;
      option.per_instance = 1;
      ITME: coverpoint ITME.value[0:0];
    endgroup
    function new(string name = "WDOGITCR_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      ITME = uvm_reg_field::type_id::create("ITME");
      ITME.configure(this, 1, 0, "RW", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGITOP_reg extends uvm_reg;
    `uvm_object_utils(WDOGITOP_reg)
    rand uvm_reg_field WDOGINT;
    rand uvm_reg_field WDOGRES;
    covergroup value_cg;
      option.per_instance = 1;
      WDOGINT: coverpoint WDOGINT.value[1:1];
      WDOGRES: coverpoint WDOGRES.value[0:0];
    endgroup
    function new(string name = "WDOGITOP_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      WDOGINT = uvm_reg_field::type_id::create("WDOGINT");
      WDOGRES = uvm_reg_field::type_id::create("WDOGRES");
      WDOGINT.configure(this, 1, 1, "WO", 0, 'h0, 1, 0, 0);
      WDOGRES.configure(this, 1, 0, "WO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID4_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID4_reg)
    rand uvm_reg_field BLKCNT;
    rand uvm_reg_field CCODE;
    covergroup value_cg;
      option.per_instance = 1;
      BLKCNT: coverpoint BLKCNT.value[7:4];
      CCODE: coverpoint CCODE.value[3:0];
    endgroup
    function new(string name = "WDOGPERIPHID4_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      BLKCNT = uvm_reg_field::type_id::create("BLKCNT");
      CCODE = uvm_reg_field::type_id::create("CCODE");
      BLKCNT.configure(this, 4, 4, "RO", 0, 'h0, 1, 0, 0);
      CCODE.configure(this, 4, 0, "RO", 0, 'h4, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID5_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID5_reg)
    rand uvm_reg_field PID5;
    covergroup value_cg;
      option.per_instance = 1;
      PID5: coverpoint PID5.value[7:0];
    endgroup
    function new(string name = "WDOGPERIPHID5_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      PID5 = uvm_reg_field::type_id::create("PID5");
      PID5.configure(this, 8, 0, "RO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID6_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID6_reg)
    rand uvm_reg_field PID6;
    covergroup value_cg;
      option.per_instance = 1;
      PID6: coverpoint PID6.value[7:0];
    endgroup
    function new(string name = "WDOGPERIPHID6_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      PID6 = uvm_reg_field::type_id::create("PID6");
      PID6.configure(this, 8, 0, "RO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID7_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID7_reg)
    rand uvm_reg_field PID7;
    covergroup value_cg;
      option.per_instance = 1;
      PID7: coverpoint PID7.value[7:0];
    endgroup
    function new(string name = "WDOGPERIPHID7_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      PID7 = uvm_reg_field::type_id::create("PID7");
      PID7.configure(this, 8, 0, "RO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID0_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID0_reg)
    rand uvm_reg_field NUMBER;
    covergroup value_cg;
      option.per_instance = 1;
      NUMBER: coverpoint NUMBER.value[7:0];
    endgroup
    function new(string name = "WDOGPERIPHID0_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      NUMBER = uvm_reg_field::type_id::create("NUMBER");
      NUMBER.configure(this, 8, 0, "RO", 0, 'h22, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID1_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID1_reg)
    rand uvm_reg_field ID;
    rand uvm_reg_field NUMBER;
    covergroup value_cg;
      option.per_instance = 1;
      ID: coverpoint ID.value[7:4];
      NUMBER: coverpoint NUMBER.value[3:0];
    endgroup
    function new(string name = "WDOGPERIPHID1_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      ID = uvm_reg_field::type_id::create("ID");
      NUMBER = uvm_reg_field::type_id::create("NUMBER");
      ID.configure(this, 4, 4, "RO", 0, 'hB, 1, 0, 0);
      NUMBER.configure(this, 4, 0, "RO", 0, 'h0X8, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID2_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID2_reg)
    rand uvm_reg_field REVISION;
    rand uvm_reg_field JEDEC;
    rand uvm_reg_field ID;
    covergroup value_cg;
      option.per_instance = 1;
      REVISION: coverpoint REVISION.value[7:4];
      JEDEC: coverpoint JEDEC.value[3:3];
      ID: coverpoint ID.value[2:0];
    endgroup
    function new(string name = "WDOGPERIPHID2_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      REVISION = uvm_reg_field::type_id::create("REVISION");
      JEDEC = uvm_reg_field::type_id::create("JEDEC");
      ID = uvm_reg_field::type_id::create("ID");
      REVISION.configure(this, 4, 4, "RO", 0, 'h1, 1, 0, 0);
      JEDEC.configure(this, 1, 3, "RO", 0, 'h1, 1, 0, 0);
      ID.configure(this, 3, 0, "RO", 0, 'h3, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPERIPHID3_reg extends uvm_reg;
    `uvm_object_utils(WDOGPERIPHID3_reg)
    rand uvm_reg_field ECONUM;
    rand uvm_reg_field CUSTNUM;
    covergroup value_cg;
      option.per_instance = 1;
      ECONUM: coverpoint ECONUM.value[7:4];
      CUSTNUM: coverpoint CUSTNUM.value[3:0];
    endgroup
    function new(string name = "WDOGPERIPHID3_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      ECONUM = uvm_reg_field::type_id::create("ECONUM");
      CUSTNUM = uvm_reg_field::type_id::create("CUSTNUM");
      ECONUM.configure(this, 4, 4, "RO", 0, 'h0, 1, 0, 0);
      CUSTNUM.configure(this, 4, 0, "RO", 0, 'h0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPCELLID0_reg extends uvm_reg;
    `uvm_object_utils(WDOGPCELLID0_reg)
    rand uvm_reg_field CID0;
    covergroup value_cg;
      option.per_instance = 1;
      CID0: coverpoint CID0.value[7:0];
    endgroup
    function new(string name = "WDOGPCELLID0_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      CID0 = uvm_reg_field::type_id::create("CID0");
      CID0.configure(this, 8, 0, "RO", 0, 'h0D, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPCELLID1_reg extends uvm_reg;
    `uvm_object_utils(WDOGPCELLID1_reg)
    rand uvm_reg_field CID1;
    covergroup value_cg;
      option.per_instance = 1;
      CID1: coverpoint CID1.value[7:0];
    endgroup
    function new(string name = "WDOGPCELLID1_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      CID1 = uvm_reg_field::type_id::create("CID1");
      CID1.configure(this, 8, 0, "RO", 0, 'hF0, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPCELLID2_reg extends uvm_reg;
    `uvm_object_utils(WDOGPCELLID2_reg)
    rand uvm_reg_field CID2;
    covergroup value_cg;
      option.per_instance = 1;
      CID2: coverpoint CID2.value[7:0];
    endgroup
    function new(string name = "WDOGPCELLID2_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      CID2 = uvm_reg_field::type_id::create("CID2");
      CID2.configure(this, 8, 0, "RO", 0, 'h05, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class WDOGPCELLID3_reg extends uvm_reg;
    `uvm_object_utils(WDOGPCELLID3_reg)
    rand uvm_reg_field CID3;
    covergroup value_cg;
      option.per_instance = 1;
      CID3: coverpoint CID3.value[7:0];
    endgroup
    function new(string name = "WDOGPCELLID3_reg");
      super.new(name, 32, UVM_CVR_ALL);
      void'(set_coverage(UVM_CVR_FIELD_VALS));
      if(has_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg = new();
      end
    endfunction
    virtual function void build();
      CID3 = uvm_reg_field::type_id::create("CID3");
      CID3.configure(this, 8, 0, "RO", 0, 'hB1, 1, 0, 0);
    endfunction
    function void sample(
      uvm_reg_data_t data,
      uvm_reg_data_t byte_en,
      bit            is_read,
      uvm_reg_map    map
    );
      super.sample(data, byte_en, is_read, map);
      sample_values(); 
    endfunction
    function void sample_values();
      super.sample_values();
      if (get_coverage(UVM_CVR_FIELD_VALS)) begin
        value_cg.sample();
      end
    endfunction
  endclass

  class rkv_watchdog_rgm extends uvm_reg_block;
    `uvm_object_utils(rkv_watchdog_rgm)
    rand WDOGLOAD_reg WDOGLOAD;
    rand WDOGVALUE_reg WDOGVALUE;
    rand WDOGCONTROL_reg WDOGCONTROL;
    rand WDOGINTCLR_reg WDOGINTCLR;
    rand WDOGRIS_reg WDOGRIS;
    rand WDOGMIS_reg WDOGMIS;
    rand WDOGLOCK_reg WDOGLOCK;
    rand WDOGITCR_reg WDOGITCR;
    rand WDOGITOP_reg WDOGITOP;
    rand WDOGPERIPHID4_reg WDOGPERIPHID4;
    rand WDOGPERIPHID5_reg WDOGPERIPHID5;
    rand WDOGPERIPHID6_reg WDOGPERIPHID6;
    rand WDOGPERIPHID7_reg WDOGPERIPHID7;
    rand WDOGPERIPHID0_reg WDOGPERIPHID0;
    rand WDOGPERIPHID1_reg WDOGPERIPHID1;
    rand WDOGPERIPHID2_reg WDOGPERIPHID2;
    rand WDOGPERIPHID3_reg WDOGPERIPHID3;
    rand WDOGPCELLID0_reg WDOGPCELLID0;
    rand WDOGPCELLID1_reg WDOGPCELLID1;
    rand WDOGPCELLID2_reg WDOGPCELLID2;
    rand WDOGPCELLID3_reg WDOGPCELLID3;
    uvm_reg_map map;
    function new(string name = "rkv_watchdog_rgm");
      super.new(name, UVM_NO_COVERAGE);
    endfunction
    virtual function void build();
      WDOGLOAD = WDOGLOAD_reg::type_id::create("WDOGLOAD");
      WDOGLOAD.configure(this);
      WDOGLOAD.build();
      WDOGVALUE = WDOGVALUE_reg::type_id::create("WDOGVALUE");
      WDOGVALUE.configure(this);
      WDOGVALUE.build();
      WDOGCONTROL = WDOGCONTROL_reg::type_id::create("WDOGCONTROL");
      WDOGCONTROL.configure(this);
      WDOGCONTROL.build();
      WDOGINTCLR = WDOGINTCLR_reg::type_id::create("WDOGINTCLR");
      WDOGINTCLR.configure(this);
      WDOGINTCLR.build();
      WDOGRIS = WDOGRIS_reg::type_id::create("WDOGRIS");
      WDOGRIS.configure(this);
      WDOGRIS.build();
      WDOGMIS = WDOGMIS_reg::type_id::create("WDOGMIS");
      WDOGMIS.configure(this);
      WDOGMIS.build();
      WDOGLOCK = WDOGLOCK_reg::type_id::create("WDOGLOCK");
      WDOGLOCK.configure(this);
      WDOGLOCK.build();
      WDOGITCR = WDOGITCR_reg::type_id::create("WDOGITCR");
      WDOGITCR.configure(this);
      WDOGITCR.build();
      WDOGITOP = WDOGITOP_reg::type_id::create("WDOGITOP");
      WDOGITOP.configure(this);
      WDOGITOP.build();
      WDOGPERIPHID4 = WDOGPERIPHID4_reg::type_id::create("WDOGPERIPHID4");
      WDOGPERIPHID4.configure(this);
      WDOGPERIPHID4.build();
      WDOGPERIPHID5 = WDOGPERIPHID5_reg::type_id::create("WDOGPERIPHID5");
      WDOGPERIPHID5.configure(this);
      WDOGPERIPHID5.build();
      WDOGPERIPHID6 = WDOGPERIPHID6_reg::type_id::create("WDOGPERIPHID6");
      WDOGPERIPHID6.configure(this);
      WDOGPERIPHID6.build();
      WDOGPERIPHID7 = WDOGPERIPHID7_reg::type_id::create("WDOGPERIPHID7");
      WDOGPERIPHID7.configure(this);
      WDOGPERIPHID7.build();
      WDOGPERIPHID0 = WDOGPERIPHID0_reg::type_id::create("WDOGPERIPHID0");
      WDOGPERIPHID0.configure(this);
      WDOGPERIPHID0.build();
      WDOGPERIPHID1 = WDOGPERIPHID1_reg::type_id::create("WDOGPERIPHID1");
      WDOGPERIPHID1.configure(this);
      WDOGPERIPHID1.build();
      WDOGPERIPHID2 = WDOGPERIPHID2_reg::type_id::create("WDOGPERIPHID2");
      WDOGPERIPHID2.configure(this);
      WDOGPERIPHID2.build();
      WDOGPERIPHID3 = WDOGPERIPHID3_reg::type_id::create("WDOGPERIPHID3");
      WDOGPERIPHID3.configure(this);
      WDOGPERIPHID3.build();
      WDOGPCELLID0 = WDOGPCELLID0_reg::type_id::create("WDOGPCELLID0");
      WDOGPCELLID0.configure(this);
      WDOGPCELLID0.build();
      WDOGPCELLID1 = WDOGPCELLID1_reg::type_id::create("WDOGPCELLID1");
      WDOGPCELLID1.configure(this);
      WDOGPCELLID1.build();
      WDOGPCELLID2 = WDOGPCELLID2_reg::type_id::create("WDOGPCELLID2");
      WDOGPCELLID2.configure(this);
      WDOGPCELLID2.build();
      WDOGPCELLID3 = WDOGPCELLID3_reg::type_id::create("WDOGPCELLID3");
      WDOGPCELLID3.configure(this);
      WDOGPCELLID3.build();
      map = create_map("map", 'h0, 4, UVM_LITTLE_ENDIAN);
      map.add_reg(WDOGLOAD, 32'h000, "RW");
      map.add_reg(WDOGVALUE, 32'h004, "RW");
      map.add_reg(WDOGCONTROL, 32'h008, "RW");
      map.add_reg(WDOGINTCLR, 32'h00C, "WO");
      map.add_reg(WDOGRIS, 32'h010, "RO");
      map.add_reg(WDOGMIS, 32'h014, "RO");
      map.add_reg(WDOGLOCK, 32'hC00, "RW");
      map.add_reg(WDOGITCR, 32'hF00, "RW");
      map.add_reg(WDOGITOP, 32'hF04, "WO");
      map.add_reg(WDOGPERIPHID4, 32'hFD0, "RO");
      map.add_reg(WDOGPERIPHID5, 32'hFD4, "RO");
      map.add_reg(WDOGPERIPHID6, 32'hFD8, "RO");
      map.add_reg(WDOGPERIPHID7, 32'hFDC, "RO");
      map.add_reg(WDOGPERIPHID0, 32'hFE0, "RO");
      map.add_reg(WDOGPERIPHID1, 32'hFE4, "RO");
      map.add_reg(WDOGPERIPHID2, 32'hFE8, "RO");
      map.add_reg(WDOGPERIPHID3, 32'hFEC, "RO");
      map.add_reg(WDOGPCELLID0, 32'hFF0, "RO");
      map.add_reg(WDOGPCELLID1, 32'hFF4, "RO");
      map.add_reg(WDOGPCELLID2, 32'hFF8, "RO");
      map.add_reg(WDOGPCELLID3, 32'hFFC, "RO");
      //WDOGLOAD.add_hdl_path_slice("???", 0, 32);
      //WDOGVALUE.add_hdl_path_slice("???", 0, 32);
      //WDOGCONTROL.add_hdl_path_slice("???", 0, 32);
      //WDOGINTCLR.add_hdl_path_slice("???", 0, 32);
      //WDOGRIS.add_hdl_path_slice("???", 0, 32);
      //WDOGMIS.add_hdl_path_slice("???", 0, 32);
      //WDOGLOCK.add_hdl_path_slice("???", 0, 32);
      //WDOGITCR.add_hdl_path_slice("???", 0, 32);
      //WDOGITOP.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID4.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID5.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID6.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID7.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID0.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID1.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID2.add_hdl_path_slice("???", 0, 32);
      //WDOGPERIPHID3.add_hdl_path_slice("???", 0, 32);
      //WDOGPCELLID0.add_hdl_path_slice("???", 0, 32);
      //WDOGPCELLID1.add_hdl_path_slice("???", 0, 32);
      //WDOGPCELLID2.add_hdl_path_slice("???", 0, 32);
      //WDOGPCELLID3.add_hdl_path_slice("???", 0, 32);
      //add_hdl_path("???");
      lock_model();
    endfunction
  endclass

