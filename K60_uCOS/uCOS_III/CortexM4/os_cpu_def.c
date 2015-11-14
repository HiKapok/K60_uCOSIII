CPU_DATA  CPU_CntLeadZeros (CPU_DATA  val)
{
    CPU_DATA  nbr_lead_zeros;

    nbr_lead_zeros = CPU_CntLeadZeros32((CPU_INT32U)val);

    return (nbr_lead_zeros);
}

/*
*********************************************************************************************************
*                                        CPU_CntLeadZeros32()
*
* Description : Count the number of contiguous, most-significant, leading zero bits in a 32-bit data value.
*
* Argument(s) : va  l         Data value to count leading zero bits.
*
* Return(s)   : Number of contiguous, most-significant, leading zero bits in 'val'.
*
* Caller(s)   : CPU_CntLeadZeros(),
*               CPU_CntTrailZeros32(),
*               Application.
*
*               This function is a CPU module application programming interface (API) function & MAY be 
*               called by application function(s).
*
* Note(s)     : (1) Supports 32-bit values :
*
*                          b31  b30  b29  ...  b04  b03  b02  b01  b00    # Leading Zeros
*                          ---  ---  ---       ---  ---  ---  ---  ---    ---------------
*                           1    x    x         x    x    x    x    x            0
*                           0    1    x         x    x    x    x    x            1
*                           0    0    1         x    x    x    x    x            2
*                           :    :    :         :    :    :    :    :            :
*                           :    :    :         :    :    :    :    :            :
*                           0    0    0         1    x    x    x    x           27
*                           0    0    0         0    1    x    x    x           28
*                           0    0    0         0    0    1    x    x           29
*                           0    0    0         0    0    0    1    x           30
*                           0    0    0         0    0    0    0    1           31
*                           0    0    0         0    0    0    0    0           32
*
*
*                   See also 'CPU COUNT LEAD ZEROs LOOKUP TABLE  Note #1'.
*********************************************************************************************************
*/


CPU_DATA  CPU_CntLeadZeros32 (CPU_INT32U  val)
{
    CPU_DATA  nbr_lead_zeros;
                                                                                /* ---------- ASM-OPTIMIZED ----------- */
    nbr_lead_zeros  =  CPU_CntLeadZeros((CPU_DATA)val);
    nbr_lead_zeros -= 0u;

    return (nbr_lead_zeros);
}
