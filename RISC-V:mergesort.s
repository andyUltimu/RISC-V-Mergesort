.data
test1: .word 16,2,4,16,4,10,12,2,14,8,4,14,6,4,2,10,12,6,10,2,14,14,6,8,16,8,16,6,12,10,8,123
test2: .word 470,405,225,197,126,122,56,33,-81,-275,-379,-409,-416,-496,-500
test3: .word 412,-474,443,171,-23,247,221,7,40,221,-90,61,-9,49,-80,-80,221,-379,-161,-397,-173,276,-197,221,-12,-145,101
TEST1_SIZE: .word 32
TEST2_SIZE: .word 15
TEST3_SIZE: .word 27

.text
    li    ra, -1
main:
    
    ### Mergesort for test1
    
    ####
    # s0 : address of test1
    # s1 : TEST1_SIZE
    ####
    
    # Get address of test1
    addi sp, sp, -4          # increase stack by a word
    sw s0, 0(sp)             # store s0 on stack
    la s0, test1             # s0 = address of test1
    
    # Get TEST1_SIZE
    addi sp, sp, -4          # increase stack by a word
    sw s1, 0(sp)             # store s1 on stack
    la s1, TEST1_SIZE        # t0 = &TEST1_SIZE
    lw s1, 0(s1)             # s1 = TEST1_SIZE

    ## Call func_mergesort
    
    # Caller saved (before the function call)
    addi sp, sp, -4          # increase stack by a word
    sw ra, 0(sp)             # store ra on stack
    
    # Pass parameter a0
    mv a0, s0                # a0 = address of test1
    
    # Pass parameter a1
    li a1, 0                 # a1 = start
    
    # Pass Paramter a2
    addi a2, s1, -1          # a2 = TEST1_SIZE - 1
    
    # Jump to func_mergesort
    jal ra, func_mergesort   # jump to func_mergesort
    ###
    
    ## Copy Sorted array 1 to 0x10001000
    
    ###
    # t0 : address 0x10001000
    # t1 : 0x10001000
    # t3 : loop counter
    # t4 : index in byte address
    # t5 : test1[index]
    # t6 : address 0x10001000 + (index in byte address)
    ###
    
    # Initialize loop counter
    li t3, 0                     # t3 = 0
    
    # Get 0x10001000 in t6
    li t1, 268439552             # t1 = 0x10001000
    la t0, 0                     # t0 = address of 0x00000000
    add t0, t0, t1               # t0 = address of 0x10001000

copySortedArray1:
    
    # Get index of sorted array 1
    slli t4, t3, 2               # t4 = loop counter * 4, index in byte address
    
    # Get test1[index]
    add t5, s0, t4               # t5 = &test1[index]
    lw t5, 0(t5)                 # t5 = test1[index]
    
    # Get memory address corresponding to sorted array
    add t6, t0, t4               # t6 = address 0x10001000 + (index in byte address)
    
    # Store test1[index] at 0x10001000 + (index in byte address)
    sw t5, 0(t6) 
    
    addi t3, t3, 1               # loop counter++
    blt t3, s1, copySortedArray1 # if (counter < TEST1_SIZE), go to copySortedArray1
    
    ## Retrieve ra and Callee saved
    lw ra, 0(sp)                 # load back ra
    lw s0, 4(sp)                 # load back s0
    lw s1, 8(sp)                 # load back s1
    addi sp, sp, 12              # delete 3 words in stack
    
    
    ### Mergesort for test2
    
    ####
    # s0 : address of test2
    # s1 : TEST2_SIZE
    ####
    
    # Get address of test2
    addi sp, sp, -4          # increase stack by a word
    sw s0, 0(sp)             # store s0 on stack
    la s0, test2             # s0 = address of test2
    
    # Get TEST2_SIZE
    addi sp, sp, -4          # increase stack by a word
    sw s1, 0(sp)             # store s1 on stack
    la s1, TEST2_SIZE        # t0 = &TEST2_SIZE
    lw s1, 0(s1)             # s1 = TEST2_SIZE

    ## Call func_mergesort
    
    # Caller saved (before the function call)
    addi sp, sp, -4          # increase stack by a word
    sw ra, 0(sp)             # store ra on stack
    
    # Pass parameter a0
    mv a0, s0                # a0 = address of test2
    
    # Pass parameter a1
    li a1, 0                 # a1 = start
    
    # Pass Paramter a2
    addi a2, s1, -1          # a2 = TEST2_SIZE - 1
    
    # Jump to func_mergesort
    jal ra, func_mergesort   # jump to func_mergesort
    ###
    
    ## Copy Sorted array 2 to 0x10002000
    
    ###
    # t0 : address 0x10002000
    # t1 : 0x10002000
    # t3 : loop counter
    # t4 : index in byte address
    # t5 : test2[index]
    # t6 : address 0x10002000 + (index in byte address)
    ###
    
    # Initialize loop counter
    li t3, 0                     # t3 = 0
    
    # Get 0x10002000 in t6
    li t1, 268443648             # t1 = 0x10002000
    la t0, 0                     # t0 = address of 0x00000000
    add t0, t0, t1               # t0 = address of 0x10002000

copySortedArray2:
    
    # Get index of sorted array 2
    slli t4, t3, 2               # t4 = loop counter * 4, index in byte address
    
    # Get test2[index]
    add t5, s0, t4               # t5 = &test2[index]
    lw t5, 0(t5)                 # t5 = test2[index]
    
    # Get memory address corresponding to sorted array
    add t6, t0, t4               # t6 = address 0x10002000 + (index in byte address)
    
    # Store test2[index] at 0x10002000 + (index in byte address)
    sw t5, 0(t6) 
    
    addi t3, t3, 1               # loop counter++
    blt t3, s1, copySortedArray2 # if (counter < TEST2_SIZE), go to copySortedArray2
    
    ## Retrieve ra and Callee saved
    lw ra, 0(sp)                 # load back ra
    lw s0, 4(sp)                 # load back s0
    lw s1, 8(sp)                 # load back s1
    addi sp, sp, 12              # delete 3 words in stack
    
    
    ### Mergesort for test3
    
    ####
    # s0 : address of test3
    # s1 : TEST3_SIZE
    ####
    
    # Get address of test3
    addi sp, sp, -4          # increase stack by a word
    sw s0, 0(sp)             # store s0 on stack
    la s0, test3             # s0 = address of test3
    
    # Get TEST3_SIZE
    addi sp, sp, -4          # increase stack by a word
    sw s1, 0(sp)             # store s1 on stack
    la s1, TEST3_SIZE        # t0 = &TEST3_SIZE
    lw s1, 0(s1)             # s1 = TEST3_SIZE

    ## Call func_mergesort
    
    # Caller saved (before the function call)
    addi sp, sp, -4          # increase stack by a word
    sw ra, 0(sp)             # store ra on stack
    
    # Pass parameter a0
    mv a0, s0                # a0 = address of test3
    
    # Pass parameter a1
    li a1, 0                 # a1 = start
    
    # Pass Paramter a2
    addi a2, s1, -1          # a2 = TEST3_SIZE - 1
    
    # Jump to func_mergesort
    jal ra, func_mergesort   # jump to func_mergesort
    ###
    
    ## Copy Sorted array 3 to 0x10003000
    
    ###
    # t0 : address 0x10003000
    # t1 : 0x10003000
    # t3 : loop counter
    # t4 : index in byte address
    # t5 : test3[index]
    # t6 : address 0x10003000 + (index in byte address)
    ###
    
    # Initialize loop counter
    li t3, 0                     # t3 = 0
    
    # Get 0x10003000 in t6
    li t1, 268447744             # t1 = 0x10003000
    la t0, 0                     # t0 = address of 0x00000000
    add t0, t0, t1               # t0 = address of 0x10003000

copySortedArray3:
    
    # Get index of sorted array 3
    slli t4, t3, 2               # t4 = loop counter * 4, index in byte address
    
    # Get test3[index]
    add t5, s0, t4               # t5 = &test3[index]
    lw t5, 0(t5)                 # t5 = test3[index]
    
    # Get memory address corresponding to sorted array
    add t6, t0, t4               # t6 = address 0x10003000 + (index in byte address)
    
    # Store test3[index] at 0x10003000 + (index in byte address)
    sw t5, 0(t6) 
    
    addi t3, t3, 1               # loop counter++
    blt t3, s1, copySortedArray3 # if (counter < TEST3_SIZE), go to copySortedArray3
    
    ## Retrieve ra and Callee saved
    lw ra, 0(sp)                 # load back ra
    lw s0, 4(sp)                 # load back s0
    lw s1, 8(sp)                 # load back s1
    addi sp, sp, 16              # delete 3 words in stack
    
    
    ret                          # jalr x0, ra, 0
     
    
func_mergesort: 

    ## mergesort(*arr, start, end)  
 
    ####
    # a0 : *arr
    # a1 : start
    # a2 : mid
    # t0 : start
    # t1 : mid
    # t2 : end
    ####
        
    # Get start
    mv t0, a1                         # t0 = start
    
    # Get end
    mv t2, a2                         # t2 = end
    
    # Check for end of recursion
    bge t0, t2, recursionReturns      # if (start >= end), go to recursionReturns
    
    # Get mid
    add t1, t2, t0                    # t1 = end + start
    srli t1, t1, 1                    # t1 = (end + start) / 2

Recursion1:    

    # Caller saved
    addi sp, sp, -16                  # increase stack by 4 words
    sw ra, 12(sp)                     # store ra on stack
    sw t0, 8(sp)                      # store start on stack
    sw t1, 4(sp)                      # store mid on stack
    sw t2, 0(sp)                      # store end on stack
    
    # Pass parameter a0
    mv a0, a0                         # a0 = address of arr
    
    # Pass start to a1
    mv a1, t0                         # a1 = start
        
    # Pass mid to a2
    mv a2, t1                         # a2 = mid
    
    # Jump to func_mergesort
    jal ra, func_mergesort            # mergesort(arr, start, mid)
    ### 
    
    # Retrieve back and delete stack
    lw ra, 12(sp)                     # retrieve ra
    lw t0, 8(sp)                      # retrieve start
    lw t1, 4(sp)                      # retrieve mid
    lw t2, 0(sp)                      # retrieve end
    addi sp, sp, 16                   # delete stack
    
Recursion2:
    
    ## mergesort(arr, mid+1, end)
    
    # Caller saved
    addi sp, sp, -16                  # increase stack by 4 words
    sw ra, 12(sp)                     # store ra on stack
    sw t0, 8(sp)                      # store start on stack
    sw t1, 4(sp)                      # store mid on stack
    sw t2, 0(sp)                      # store end on stack
    
    # Pass parameter a0
    mv a0, a0                         # a0 = address of arr
    
    # Pass parameter a1
    addi a1, t1, 1                    # a1 = mid + 1
    
    # Pass parameter a2
    mv a2, t2                         # a2 = end
    
    # Jump to func_mergesort
    jal ra, func_mergesort            # mergesort(arr, mid+1, end)
    ###
    
    lw ra, 12(sp)                     # retrieve ra
    lw t0, 8(sp)                      # retrieve start
    lw t1, 4(sp)                      # retrieve mid
    lw t2, 0(sp)                      # retrieve end
    addi sp, sp, 16                   # delete stack
    
    ## Call func_merge
    
    # Caller saved 
    addi sp, sp, -4                   # increase stack by a word
    sw ra, 0(sp)                      # store ra on stack
    
    # Pass Parameter a0
    mv a0, a0                         # a0 = address of arr
    
    # Pass Parameter a1
    mv a1, t0                         # a1 = start
    
    # Pass Parameter a2
    mv a2, t1                         # a2 = mid
    
    # Pass Parameter a3
    mv a3, t2                         # a3 = end
    
    # Jump to func_merge
    jal ra, func_merge                # merge(arr, start, mid, end)
    ###
    
    # Retrieve ra and delete stack
    lw ra, 0(sp)                      # retrieve ra
    addi sp, sp, 4                    # delete stack
    
    ret                               # go to function that invokes this function

    
func_merge:
    
    ####
    # a0 : *arr
    # a1 : start
    # a2 : mid
    # a3 : end
    ####
    
    ## Temp array store in stack
    
    ###
    # t3 : temp_size
    # t4 : loop counter
    # t5 : arr[i+start]
    ###
        
    # Get temp_size (t3)
    sub t3, a3, a1             # t3 = end-start
    addi t3, t3, 1             # t3 = end-start+1
    
    # Initialize loop counter (t4)
    li t4, 0                   # t4 = 0
    
makeTempArray:
    
    # Get arr[i+start] into t5
    add t5, t4, a1             # t5 = i + start    
    slli t5, t5, 2             # t5 = (i+start) * 4, i+start in byte address
    add t5, a0, t5             # t5 = &arr[i+start]
    lw t5, 0(t5)               # t5 = arr[i+start]
    
    # Store arr[i+start] on stack
    addi sp, sp, -4            # increase stack by a word
    sw t5, 0(sp)               # temp[i] = arr[i+start]
    
    addi t4, t4, 1             # loop counter++
    blt t4, t3, makeTempArray  # if (loop counter < temp_size), go to makeTempArray


    ## Compare left and right value in temp[] to reorder a section in arr[]  

    ###
    # t0 : arr_index 
    # t1 : left index value 
    # t2 : right index value
    # t3 : left_index
    # t4 : right_index
    # t5 : left_max
    # t6 : right_max = last index
    ###
    
    # Initialize left_index (t3)
    li t3, 0                   # t3 = 0
    
    # initialize right_index (t4)
    sub t4, a2, a1             # t4 = mid-start
    addi t4, t4, 1             # t4 = mid-start+1
    
    # initialize left_max (t5)
    sub t5, a2, a1             # t5 = mid-start
    
    # initialize right_max (t6)
    sub t6, a3, a1             # t6 = end-start
    
    # initialize arr_index (t0)
    mv t0, a1                  # t0 = start
    
orderArrSection:
    
    # Get temp[left_index] into t1
    sub t1, t6, t3             # t1 = last index - left_index = distance from sp to left_index
    slli t1, t1, 2             # t1 = distance * 4, distance in byte address
    add t1, sp, t1             # t1 = &temp[left_index]
    lw t1, 0(t1)               # t1 = temp[left_index]
    
    # Get temp[right_index] into t2
    sub t2, t6, t4             # t2 = last index - right_index = distance from sp to right_index
    slli t2, t2, 2             # t2 = distance * 4, distance in byte address
    add t2, sp, t2             # t2 = &temp[right_index]
    lw t2, 0(t2)               # t2 = temp[right_index]
    
    # Check temp[right_index] < temp[left_index]
    blt t2, t1, rightIsSmaller # if (right value < left value), go to rightIsSmaller
        
    ## arr[arr_index] = temp[left_index]
    
        ####
        # t0 = &arr[arr_index]
        ####

    # Store arr_index (t0) on stack
    addi sp, sp, -4              # increase a word in stack
    sw t0, 0(sp)                 # store arr_index on stack

    # Get &arr[arr_index] into t0
    slli t0, t0, 2               # t0 = arr_index * 4, arr_index in byte address
    add t0, a0, t0               # t0 = &arr[arr_index]
    
    # Store left value (t1) in &arr[arr_index]
    sw t1, 0(t0)                 # arr[arr_index] = temp[left_index]
        
    # Load back arr_index (t0) and delete top of stack
    lw t0, 0(sp)                 # load back arr_index on stack
    addi sp, sp, 4               # delete top of stack
    
    addi t0, t0, 1               # arr_index++
    addi t3, t3, 1               # left_index++
    
    beq x0, x0, checkMaxIndexReached 
    
rightIsSmaller:
    
    ## arr[arr_index] = temp[right_index]
    
        ###
        # t0 : &arr[arr_index]
        ###
    
    # Store arr_index (t0) on stack
    addi sp, sp, -4              # increase a word in stack
    sw t0, 0(sp)                 # store arr_index on stack

    # Get &arr[arr_index] into t0
    slli t0, t0, 2               # t0 = arr_index * 4, arr_index in byte address
    add t0, a0, t0               # t0 = &arr[arr_index]
        
    # Store right value in &arr[arr_index]
    sw t2, 0(t0)                 # arr[arr_index] = temp[right_index]
        
    # Load back arr_index (t0) and delete top of stack
    lw t0, 0(sp)                 # load back arr_index on stack
    addi sp, sp, 4               # delete top of stack
    
    ###
    # t0 : arr_index
    ###
    
    addi t0, t0, 1               # arr_index++
    addi t4, t4, 1               # right_index++
    
checkMaxIndexReached:
    
    blt t5, t3, endOrderArrSection # if (left_max < left_index), go to endOrderArrSection
    
    blt t4, t6, orderArrSection  # if (right_index < right_max), go to orderArrSection
    beq t4, t6, orderArrSection  # if (right_index == right_max), go to orderArrSection
    
endOrderArrSection:
    
    ## Push in not compared left value into arr[]
    
    ###
    # t1 : &arr[arr_index]
    # t2 : temp[left_index]
    ###
    
    blt t5, t3, endPushInLeftValue # if (left_max < left_index), go to endPushInLeftValue
    
pushInLeftValue:
    
    # Get temp[left_index] into t2
    sub t2, t6, t3                 # t2 = last index - left_index = distance from sp to left_index
    slli t2, t2, 2                 # t2 = distance * 4, distance in byte address
    add t2, sp, t2                 # t2 = &temp[left_index]
    lw t2, 0(t2)                   # t2 = temp[left_index]
    
    # Get &arr[arr_index] into t1
    slli t1, t0, 2                 # t1 = arr_index * 4, arr_index in byte address
    add t1, a0, t1                 # t1 = &arr[arr_index]
    
    # Push in left value into arr[]
    sw t2, 0(t1)                   # arr[arr_index] = temp[left_index]
    
    addi t0, t0, 1                 # arr_index++
    addi t3, t3, 1                 # left_index++
    
    blt t3, t5, pushInLeftValue    # if (left_index < left_max), go to pushInLeftValue
    beq t3, t5, pushInLeftValue    # if (left_index == left_max), go to pushInLeftValue
    
endPushInLeftValue:
    
    ## Push in not yet compared right value into arr[]
    
    ###
    # t1 : &arr[arr_index]
    # t2 : temp[right_index]
    ###
    
    blt t6, t4, endPushInRightValue # if (right_max < right_index), go to endPushInLeftValue
    
pushInRightValue:
 
    # Get temp[right_index] into t2
    sub t2, t6, t4                 # t2 = last index - right_index = distance from sp to right_index
    slli t2, t2, 2                 # t2 = distance * 4, distance into byte address
    add t2, sp, t2                 # t2 = &temp[right_index]
    lw t2, 0(t2)                   # t2 = temp[right_index]
    
    # Get &arr[arr_index] into t1
    slli t1, t0, 2                 # t1 = arr_index * 4, arr_index in byte address
    add t1, a0, t1                 # t1 = &arr[arr_index]
    
    # Push in right value into arr[]
    sw t2, 0(t1)                   # arr[arr_index] = temp[right_index]   
    
    addi t0, t0, 1                 # arr_index++
    addi t4, t4, 1                 # right_index++
    
    blt t4, t6, pushInRightValue   # if (right_index < right_max), go to pushInRightValue
    beq t4, t6, pushInRightValue   # if (right_index == right_max), go to pushInRightValue
    
endPushInRightValue:
    
    ## Delete temp array in stack
    
    ###
    # t3 : temp_size
    # t4 : loop counter
    ###
    
    # Get temp_size into t3
    addi t3, t6, 1                 # t3 = right_max + 1
    
    # Initialize loop counter (t4)
    li t4, 0                       # t4 = 0
    
deleteTempArray:
    
    addi sp, sp, 4                 # delete stack by a word
    
    addi t4, t4, 1                 # loop counter++
    blt t4, t3, deleteTempArray    # if (counter < temp_size), go to deleteTempArray
    
    # recursion return after end of merge, go to function that invoked mergesort or go to main
    
    ret                            # ra to function that invoked mergesort or main

recursionReturns:
    
    # Can't divide in half further, go to mergesort(arr, mid+1, end) or merge
    
    ret                            # ra to mergesort(arr, mid+1, end) or merge