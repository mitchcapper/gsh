------------------------------------------------------------------------------
--                                                                          --
--                                  G S H                                   --
--                                                                          --
--                                                                          --
--                       Copyright (C) 2010-2014, AdaCore                   --
--                                                                          --
-- GSH is free software;  you can  redistribute it  and/or modify it under  --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion.  GSH is distributed in the hope that it will be useful, but WITH-  --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with GNAT;  see file COPYING.  If not, write --
-- to  the  Free Software Foundation,  51  Franklin  Street,  Fifth  Floor, --
-- Boston, MA 02110-1301, USA.                                              --
--                                                                          --
-- GSH is maintained by AdaCore (http://www.adacore.com)                    --
--                                                                          --
------------------------------------------------------------------------------

with Posix_Shell.Lua_Bindings;
with Lua; use Lua;
with Ada.Command_Line; use Ada.Command_Line;

function GSH_Unit return Integer is
   S : constant Lua_State := New_State;
begin
   Open_Libs (S);
   Posix_Shell.Lua_Bindings.Initialize (S);
   Load_File (S, Argument (1));

   Create_Table (S, Argument_Count);
   for Index in 2 .. Argument_Count loop
      Push (S, Lua_Unsigned (Index - 1));
      Push (S, Argument (Index));
      Set_Table (S, -3);
   end loop;
   Set_Global (S, "args");
   PCall (S);
   return 0;
end GSH_Unit;
