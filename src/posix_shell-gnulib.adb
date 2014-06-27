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

with System;

package body Posix_Shell.GNULib is

   function C_Fnmatch
     (Pattern : System.Address; Str : System.Address)
      return Integer;
   pragma Import (C, C_Fnmatch, "gsh_fnmatch");

   -------------
   -- Fnmatch --
   -------------

   function Fnmatch (Pattern : String; Str : String) return Boolean is
      C_Pattern : aliased String (1 .. Pattern'Length + 1);
      C_Str : aliased String (1 .. Str'Length + 1);
      Result : Integer;
   begin
      C_Pattern (1 .. Pattern'Length) := Pattern;
      C_Pattern (C_Pattern'Last) := ASCII.NUL;
      C_Str (1 .. Str'Length) := Str;
      C_Str (C_Str'Last) := ASCII.NUL;

      Result := C_Fnmatch (C_Pattern'Address, C_Str'Address);
      if Result = 0 then
         return True;
      else
         return False;
      end if;

   end Fnmatch;

end Posix_Shell.GNULib;
