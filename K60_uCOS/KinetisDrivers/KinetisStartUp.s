/************************************************************************************************ 
* StartUp_Kinetis
* Kinetis的启动代码,即上电后最先执行的代码,作用为关中断,同时调用C语言的启动代码
************************************************************************************************/
    SECTION .cstart : CODE
    EXPORT  StartUp_Kinetis
 
StartUp_Kinetis

    CPSIE   i                        ; 关闭中断
    
    import  Start_C_Kinetis
    BL      Start_C_Kinetis          ; 调用C语言的初始化代码

    END
