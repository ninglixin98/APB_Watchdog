# APB_Watchdog —— spec阅读与功能理解
## APB_Watchdog的接口信号
![输入图片描述](http://www.ninglixin.com/wp-content/uploads/2022/08/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220805211657.png)

- APB信号
	- PCLK：APB总线时钟信号
	- PRESETn：APB总线复位信号
	- PSEL：为0时进入IDLE状态，为1时进入传输状态（SETUP、ENABLE）
	- PADDR：APB地址信号，注意这里不取低两位
	- PENABLE：为0时进入SETUP状态，为1时进入ENABLE状态
	- PWRITE：读写信号，1为写，0为读
	- PWDATA：写数据信号
	- PRDATA：读数据信号
- Watchdog信号
	- ECOREVNUM：ECO修订信息信号
	- WDOGCLK：Watchdog时钟信号
	- WDOGCLKEN：Watchdog时钟使能信号
	- WDOGINT：输出中断信号
	- WDOGRES：输出重启信号 

## APB_Watchdog的功能
![输入图片描述](http://www.ninglixin.com/wp-content/uploads/2022/08/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220805211805.png)

- Watchdog的功能是检测芯片内部的运行情况，当芯片长时间无响应时向系统发送重启信号

- 首先给Watchdog设置一个LOAD值，计数器会从此值为基础，依次在每个Watchdog的时钟上升沿递减
- 当计数器到达0时，如果此时interrupt功能开启，则会拉起WDOGINT信号，并且重新载入LOAD值，并再次递减
- 在计数器第二次递减的过程中如果清除了interrupt信号，则会回到上一阶段，重新载入LOAD值并再次递减
- 如果没有及时清除interrupt，当计数器第二次到达0时，若重启信号功能打开，则会拉高RESEN信号，从而告知系统芯片长时间无响应，需要重启

## APB_Watchdog的寄存器
![输入图片描述](http://www.ninglixin.com/wp-content/uploads/2022/08/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20220805212058.png)

- WDOGLOAD：WDOGLOAD存器存放计数器用来递减的值。当写入此寄存器后，计数将立即从新值重新启动。LOAD的最小有效值为1
- WDOGVALUE：WDOGVALUE寄存器存放计数器当前值
- WDOGCONTROL：INTEN和RESEN信号的使能
- WDOGINTCLR：写入任何值后会清除interrupt信号
- WDOGRIS：WDOGRIS寄存器表示原始中断（raw interrupt）状态
- WDOGMIS：WDOGMIS寄存器表示屏蔽中断（mask interrupt）状态，该值是raw interrupt和中断使能信号INTEN的逻辑与
- WDOGLOCK：WDOGLOCK寄存器禁用对所有其他寄存器的写入访问，防止流氓软件禁用watchdog的功能，写入值0x1ACCE551允许对所有其他寄存器的写入访问，写入任何其他值将禁用写入访问
- WDOGITCR：控制集成测试模式的开启和关闭，在此集成测试模式下，WDOGITOP寄存器直接控制中断输出信号WDOGINT和重启信号WDOGRES的输出
- WDOGITOP：当处于集成测试模式时，该寄存器中的值将直接驱动中断输出信号WDOGINT和重启信号WDOGRES
