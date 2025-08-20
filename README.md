A simple code on how uvm callback works
there are 2 ways to implement callbacks:   1) `uvm_do_callback     --done in driver
                                           2) `uvm_do_obj_callback  -- sequence

ADVANTAGES OF UVM CALLBACKS:
Add features without touching base code.
Reuse the same component in different environments with different behaviors.
Inject error conditions, custom logging, or protocol violations for stress testing.
Keep code clean, modular, and reusable.


--- Aditya
