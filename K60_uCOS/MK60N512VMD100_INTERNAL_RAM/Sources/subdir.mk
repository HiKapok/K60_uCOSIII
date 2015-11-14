################################################################################
# 自动生成的文件。不要编辑！
################################################################################

-include ../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"../Sources/main.c" \

C_SRCS += \
../Sources/main.c \

OBJS += \
./Sources/main.obj \

C_DEPS += \
./Sources/main.d \

OBJS_QUOTED += \
"./Sources/main.obj" \

OBJS_OS_FORMAT += \
./Sources/main.obj \


# Each subdirectory must supply rules for building sources it contributes
Sources/main.obj: ../Sources/main.c
	@echo '正在构建文件： $<'
	@echo '正在调用： ARM Compiler'
	"$(ARM_ToolsDirEnv)/mwccarm" -gccinc @@"Sources/main.args" -o "Sources/main.obj" -c "$<" -MD -gccdep
	@echo '已结束构建： $<'
	@echo ' '

Sources/%.d: ../Sources/%.c
	@echo '正在生成依赖文件： $@'
	
	@echo ' '


