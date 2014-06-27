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

with Posix_Shell.Variables; use Posix_Shell.Variables;

package Posix_Shell.Tree.Evals is

   Continue_Exception : exception;
   Break_Exception : exception;

   procedure Eval (S : Shell_State_Access; T : Shell_Tree);
   procedure Eval (S : Shell_State_Access; T : Shell_Tree; N : Node_Id);
   procedure Eval (S : Shell_State_Access; T : Shell_Tree; N : Node);

   function Eval
     (S : Shell_State_Access;
      T : Shell_Tree) return String;

end Posix_Shell.Tree.Evals;
