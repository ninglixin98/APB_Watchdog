class c_3_2;
    rand bit[0:0] intval; // rand_mode = ON 

    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (../seq_lib/rkv_watchdog_countdown_virt_seq.sv:19)
    {
       (intval == 50);
    }
endclass

program p_3_2;
    c_3_2 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x01z00zzz1zx01xz1xzx1x0zx0x11x0xxzxxzxzxxzxxzxzzzxzzzxxzzxxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
