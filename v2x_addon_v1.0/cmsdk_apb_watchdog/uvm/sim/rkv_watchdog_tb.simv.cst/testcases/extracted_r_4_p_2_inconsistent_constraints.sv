class c_4_2;
    rand bit[0:0] intval; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/rkv_watchdog_countdown_virt_seq.sv:19)
    {
       (intval == 50);
    }
endclass

program p_4_2;
    c_4_2 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz10x1z01xzx10zx1xzx00x1x0zz10x1zzzxzzxxxzxzzxzxzzxxzxxxzxxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
