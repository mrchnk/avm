/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package avmplus {

    // this namespace exists solely so that nativegen.py will encounter them during shell building,
    // thus giving us a test case for parsing methods with custom namespaces in nativegen.py
    namespace ns_example = "http://www.example.com"

    // this interface exists solely so that nativegen.py will encounter them during shell building,
    // thus giving us a test case for interface parsing in nativegen.py
    interface ITest {
        function test();
    }

    class CTest //implements ITest
    {
        public function test() {
        }
    }
}

package avmshell {

    // this class exists solely to test construct="abstract"
    [native(cls="::avmshell::AbstractBaseClass", instance="::avmshell::AbstractBaseObject", gc="exact", methods="auto", construct="abstract")]
    public class AbstractBase
    {
    }

    // this class exists solely to test construct="abstract"
    [native(cls="::avmshell::NativeSubclassOfAbstractBaseClass", instance="::avmshell::NativeSubclassOfAbstractBaseObject", gc="exact", methods="auto")]
    public class NativeSubclassOfAbstractBase extends AbstractBase
    {
    }

    // this class exists solely to test construct="abstract"
    public class SubclassOfAbstractBase extends AbstractBase
    {
    }

    // this class exists solely to test construct="restricted"
    [native(cls="::avmshell::RestrictedBaseClass", instance="::avmshell::RestrictedBaseObject", gc="exact", methods="auto", construct="restricted")]
    public class RestrictedBase
    {
    }

    // this class exists solely to test construct="restricted"
    [native(cls="::avmshell::NativeSubclassOfRestrictedBaseClass", instance="::avmshell::NativeSubclassOfRestrictedBaseObject", gc="exact", methods="auto")]
    public class NativeSubclassOfRestrictedBase extends RestrictedBase
    {
    }

    // this class exists solely to test construct="restricted"
    public class SubclassOfRestrictedBase extends RestrictedBase
    {
    }

    // this class exists solely to test construct="abstract-restricted"
    [native(cls="::avmshell::AbstractRestrictedBaseClass", instance="::avmshell::AbstractRestrictedBaseObject", gc="exact", methods="auto", construct="abstract-restricted")]
    public class AbstractRestrictedBase
    {
    }

    // this class exists solely to test construct="abstract-restricted"
    [native(cls="::avmshell::NativeSubclassOfAbstractRestrictedBaseClass", instance="::avmshell::NativeSubclassOfAbstractRestrictedBaseObject", gc="exact", methods="auto")]
    public class NativeSubclassOfAbstractRestrictedBase extends AbstractRestrictedBase
    {
    }

    // this class exists solely to test construct="abstract-restricted"
    public class SubclassOfAbstractRestrictedBase extends AbstractRestrictedBase
    {
    }

    // this class exists solely to test construct="check"
    [native(cls="::avmshell::CheckBaseClass", instance="::avmshell::CheckBaseObject", gc="exact", methods="auto", construct="check")]
    public class CheckBase
    {
    }

    // this class exists test construct="native" with a C++ class,
    // and also to test for correct calculation of slot offsets for
    // native classes with padding at the end (bugzilla 655300)
    [native(cls="::avmshell::NativeBaseClass", instance="::avmshell::NativeBaseObject", gc="exact", methods="auto", construct="native")]
    public class NativeBase
    {
    }

    // this class exists solely to test for correct calculation of slot offsets for
    // native classes with padding at the end (bugzilla 655300)
    public class NativeBaseExtender1 extends NativeBase
    {
        private var foo:int;
    }

    // this class exists solely to test for correct calculation of slot offsets for
    // native classes with padding at the end (bugzilla 655300)
    public class NativeBaseExtender2 extends NativeBase
    {
        private var foo:int;
        private var foo1:int;
        private var foo2:int;
    }

    // this class exists solely to test construct="native" with a pure-AS3 class
    [native(construct="native")]
    public class NativeBaseAS3
    {
    }

    // this class exists solely to test friend="someclass"
    [native(friend="avmshell::ShellCore")]
    public class ShellCoreFriend1
    {
        static private var foo:int = 42;
    }

    // this class exists solely to test friend="someclass"
    [native(friend="avmshell::ShellCore,avmshell::ShellToplevel")]
    public class ShellCoreFriend2
    {
        static private var bar:int = 101;
    }
}

// The flash.system package is present so identical ATS test media can be used
// in the command-line VM and the Player
package flash.system
{
    import avmplus.*;

    public final class Capabilities
    {
        public static function get playerType():String { return "AVMPlus"; }
        public static function get isDebugger():Boolean { return System.isDebugger(); }
    }
}

// test library code

/*
 tests
 - unversioned names: are in all versions, as though version 0
 - versioned names: are not visible to smaller versions (bindings, not number)
 - multiple versioned names: are visible to all compatible versions
 - class, interface, method, accessor, slot, static names
 - running multiple active versions
*/

// API Versioning - Globals
// moved from "avmplus" to "avmshell" to avoid having avmplus be unversioned in builtin, but versioned in shell
package avmshell
{

// Shadow the declarations into public vars solely so that the acceptance tests
// can read them; they can't simple include api-versions.as because the CONFIG
// namespace is special and available only to builtin code (which the acceptance
// tests aren't).
// NB: 660 is a legacy wart due to existing ASC.jar expecting that as the first
// version. It's a bit ugly but keeping it is easier than modifying asc.jar at this point.
// (Since this magic value only affects builtin code we could change it in the future
// without affecting existing content, though.)
public const API_AIR_1_0 = CONFIG::AIR_1_0 - 660;
public const API_FP_10_0 = CONFIG::FP_10_0 - 660;
public const API_AIR_1_5 = CONFIG::AIR_1_5 - 660;
public const API_AIR_1_5_1 = CONFIG::AIR_1_5_1 - 660;
public const API_FP_10_0_32 = CONFIG::FP_10_0_32 - 660;
public const API_AIR_1_5_2 = CONFIG::AIR_1_5_2 - 660;

public var public_var:Boolean = true;
[API(CONFIG::AIR_1_0)] public var public_var_AIR_1_0:Boolean = true;
[API(CONFIG::FP_10_0)] public var public_var_FP_10_0:Boolean = true;
[API(CONFIG::AIR_1_5)] public var public_var_AIR_1_5:Boolean = true;
[API(CONFIG::AIR_1_5_1)] public var public_var_AIR_1_5_1:Boolean = true;
[API(CONFIG::FP_10_0_32)] public var public_var_FP_10_0_32:Boolean = true;
[API(CONFIG::AIR_1_5_2)] public var public_var_AIR_1_5_2:Boolean = true;
[API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public var public_var_AIR_1_0_FP_10_0:Boolean = true;
[API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public var public_var_AIR_1_5_1_FP_10_0_AIR_1_5_2:Boolean = true;
[API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public var public_var_FP_10_0_32_AIR_1_0_FP_10_0:Boolean = true;

public const public_const:Boolean = true;
[API(CONFIG::AIR_1_0)] public const public_const_AIR_1_0:Boolean = true;
[API(CONFIG::FP_10_0)] public const public_const_FP_10_0:Boolean = true;
[API(CONFIG::AIR_1_5)] public const public_const_AIR_1_5:Boolean = true;
[API(CONFIG::AIR_1_5_1)] public const public_const_AIR_1_5_1:Boolean = true;
[API(CONFIG::FP_10_0_32)] public const public_const_FP_10_0_32:Boolean = true;
[API(CONFIG::AIR_1_5_2)] public const public_const_AIR_1_5_2:Boolean = true;
[API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public const public_const_AIR_1_0_FP_10_0:Boolean = true;
[API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public const public_const_AIR_1_5_1_FP_10_0_AIR_1_5_2:Boolean = true;
[API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public const public_const_FP_10_0_32_AIR_1_0_FP_10_0:Boolean = true;

public function public_function():Boolean { return true; }
[API(CONFIG::AIR_1_0)] public function public_function_AIR_1_0():Boolean { return true; }
[API(CONFIG::FP_10_0)] public function public_function_FP_10_0():Boolean { return true; }
[API(CONFIG::AIR_1_5)] public function public_function_AIR_1_5():Boolean { return true; }
[API(CONFIG::AIR_1_5_1)] public function public_function_AIR_1_5_1():Boolean { return true; }
[API(CONFIG::FP_10_0_32)] public function public_function_FP_10_0_32():Boolean { return true; }
[API(CONFIG::AIR_1_5_2)] public function public_function_AIR_1_5_2():Boolean { return true; }
[API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function public_function_AIR_1_0_FP_10_0():Boolean { return true; }
[API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public function public_function_AIR_1_5_1_FP_10_0_AIR_1_5_2():Boolean { return true; }
[API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function public_function_FP_10_0_32_AIR_1_0_FP_10_0():Boolean { return true; }

public function get public_getset():Boolean { return true; }
[API(CONFIG::AIR_1_0)] public function get public_getset_AIR_1_0():Boolean { return true; }
[API(CONFIG::FP_10_0)] public function get public_getset_FP_10_0():Boolean { return true; }
[API(CONFIG::AIR_1_5)] public function get public_getset_AIR_1_5():Boolean { return true; }
[API(CONFIG::AIR_1_5_1)] public function get public_getset_AIR_1_5_1():Boolean { return true; }
[API(CONFIG::FP_10_0_32)] public function get public_getset_FP_10_0_32():Boolean { return true; }
[API(CONFIG::AIR_1_5_2)] public function get public_getset_AIR_1_5_2():Boolean { return true; }
[API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function get public_getset_AIR_1_0_FP_10_0():Boolean { return true; }
[API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public function get public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2():Boolean { return true; }
[API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function get public_getset_FP_10_0_32_AIR_1_0_FP_10_0():Boolean { return true; }

public function set public_getset(x:*):void {  }
[API(CONFIG::AIR_1_0)] public function set public_getset_AIR_1_0(x:*):void {  }
[API(CONFIG::FP_10_0)] public function set public_getset_FP_10_0(x:*):void {  }
[API(CONFIG::AIR_1_5)] public function set public_getset_AIR_1_5(x:*):void {  }
[API(CONFIG::AIR_1_5_1)] public function set public_getset_AIR_1_5_1(x:*):void {  }
[API(CONFIG::FP_10_0_32)] public function set public_getset_FP_10_0_32(x:*):void {  }
[API(CONFIG::AIR_1_5_2)] public function set public_getset_AIR_1_5_2(x:*):void {  }
[API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function set public_getset_AIR_1_0_FP_10_0(x:*):void {  }
[API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public function set public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2(x:*):void {  }
[API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function set public_getset_FP_10_0_32_AIR_1_0_FP_10_0(x:*):void {  }

}

// API Versioning - Classes
// moved from "avmplus" to "avmshell" to avoid having avmplus be unversioned in builtin, but versioned in shell
package avmshell
{
public class public_class
{

    public var public_var:Boolean = true;
    [API(CONFIG::AIR_1_0)] public var public_var_AIR_1_0:Boolean = true;
    [API(CONFIG::FP_10_0)] public var public_var_FP_10_0:Boolean = true;
    [API(CONFIG::AIR_1_5)] public var public_var_AIR_1_5:Boolean = true;
    [API(CONFIG::AIR_1_5_1)] public var public_var_AIR_1_5_1:Boolean = true;
    [API(CONFIG::FP_10_0_32)] public var public_var_FP_10_0_32:Boolean = true;
    [API(CONFIG::AIR_1_5_2)] public var public_var_AIR_1_5_2:Boolean = true;
    [API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public var public_var_AIR_1_0_FP_10_0:Boolean = true;
    [API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public var public_var_AIR_1_5_1_FP_10_0_AIR_1_5_2:Boolean = true;
    [API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public var public_var_FP_10_0_32_AIR_1_0_FP_10_0:Boolean = true;

    public const public_const:Boolean = true;
    [API(CONFIG::AIR_1_0)] public const public_const_AIR_1_0:Boolean = true;
    [API(CONFIG::FP_10_0)] public const public_const_FP_10_0:Boolean = true;
    [API(CONFIG::AIR_1_5)] public const public_const_AIR_1_5:Boolean = true;
    [API(CONFIG::AIR_1_5_1)] public const public_const_AIR_1_5_1:Boolean = true;
    [API(CONFIG::FP_10_0_32)] public const public_const_FP_10_0_32:Boolean = true;
    [API(CONFIG::AIR_1_5_2)] public const public_const_AIR_1_5_2:Boolean = true;
    [API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public const public_const_AIR_1_0_FP_10_0:Boolean = true;
    [API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public const public_const_AIR_1_5_1_FP_10_0_AIR_1_5_2:Boolean = true;
    [API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public const public_const_FP_10_0_32_AIR_1_0_FP_10_0:Boolean = true;

    public function public_function():Boolean { return true; }
    [API(CONFIG::AIR_1_0)] public function public_function_AIR_1_0():Boolean { return true; }
    [API(CONFIG::FP_10_0)] public function public_function_FP_10_0():Boolean { return true; }
    [API(CONFIG::AIR_1_5)] public function public_function_AIR_1_5():Boolean { return true; }
    [API(CONFIG::AIR_1_5_1)] public function public_function_AIR_1_5_1():Boolean { return true; }
    [API(CONFIG::FP_10_0_32)] public function public_function_FP_10_0_32():Boolean { return true; }
    [API(CONFIG::AIR_1_5_2)] public function public_function_AIR_1_5_2():Boolean { return true; }
    [API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function public_function_AIR_1_0_FP_10_0():Boolean { return true; }
    [API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public function public_function_AIR_1_5_1_FP_10_0_AIR_1_5_2():Boolean { return true; }
    [API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function public_function_FP_10_0_32_AIR_1_0_FP_10_0():Boolean { return true; }

    public function get public_getset():Boolean { return true; }
    [API(CONFIG::AIR_1_0)] public function get public_getset_AIR_1_0():Boolean { return true; }
    [API(CONFIG::FP_10_0)] public function get public_getset_FP_10_0():Boolean { return true; }
    [API(CONFIG::AIR_1_5)] public function get public_getset_AIR_1_5():Boolean { return true; }
    [API(CONFIG::AIR_1_5_1)] public function get public_getset_AIR_1_5_1():Boolean { return true; }
    [API(CONFIG::FP_10_0_32)] public function get public_getset_FP_10_0_32():Boolean { return true; }
    [API(CONFIG::AIR_1_5_2)] public function get public_getset_AIR_1_5_2():Boolean { return true; }
    [API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function get public_getset_AIR_1_0_FP_10_0():Boolean { return true; }
    [API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public function get public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2():Boolean { return true; }
    [API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function get public_getset_FP_10_0_32_AIR_1_0_FP_10_0():Boolean { return true; }

    public function set public_getset(x:*):void {  }
    [API(CONFIG::AIR_1_0)] public function set public_getset_AIR_1_0(x:*):void {  }
    [API(CONFIG::FP_10_0)] public function set public_getset_FP_10_0(x:*):void {  }
    [API(CONFIG::AIR_1_5)] public function set public_getset_AIR_1_5(x:*):void {  }
    [API(CONFIG::AIR_1_5_1)] public function set public_getset_AIR_1_5_1(x:*):void {  }
    [API(CONFIG::FP_10_0_32)] public function set public_getset_FP_10_0_32(x:*):void {  }
    [API(CONFIG::AIR_1_5_2)] public function set public_getset_AIR_1_5_2(x:*):void {  }
    [API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function set public_getset_AIR_1_0_FP_10_0(x:*):void {  }
    [API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public function set public_getset_AIR_1_5_1_FP_10_0_AIR_1_5_2(x:*):void {  }
    [API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public function set public_getset_FP_10_0_32_AIR_1_0_FP_10_0(x:*):void {  }
}

[API(CONFIG::AIR_1_0)] public class  public_class_AIR_1_0 {  }
[API(CONFIG::FP_10_0)] public class  public_class_FP_10_0 {  }
[API(CONFIG::AIR_1_5)] public class  public_class_AIR_1_5 {  }
[API(CONFIG::AIR_1_5_1)] public class  public_class_AIR_1_5_1 {  }
[API(CONFIG::FP_10_0_32)] public class  public_class_FP_10_0_32 {  }
[API(CONFIG::AIR_1_5_2)] public class  public_class_AIR_1_5_2 {  }
[API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public class  public_class_AIR_1_0_FP_10_0 {  }
[API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public class  public_class_AIR_1_5_1_FP_10_0_AIR_1_5_2 {  }
[API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public class  public_class_FP_10_0_32_AIR_1_0_FP_10_0 {  }

public interface  public_interface {}
[API(CONFIG::AIR_1_0)] public interface  public_interface_AIR_1_0 {  }
[API(CONFIG::FP_10_0)] public interface  public_interface_FP_10_0 {  }
[API(CONFIG::AIR_1_5)] public interface  public_interface_AIR_1_5 {  }
[API(CONFIG::AIR_1_5_1)] public interface  public_interface_AIR_1_5_1 {  }
[API(CONFIG::FP_10_0_32)] public interface  public_interface_FP_10_0_32 {  }
[API(CONFIG::AIR_1_5_2)] public interface  public_interface_AIR_1_5_2 {  }
[API(CONFIG::AIR_1_0,CONFIG::FP_10_0)] public interface  public_interface_AIR_1_0_FP_10_0 {  }
[API(CONFIG::AIR_1_5_1,CONFIG::FP_10_0,CONFIG::AIR_1_5_2)] public interface  public_interface_AIR_1_5_1_FP_10_0_AIR_1_5_2 {  }
[API(CONFIG::FP_10_0_32,CONFIG::AIR_1_0,CONFIG::FP_10_0)] public interface  public_interface_FP_10_0_32_AIR_1_0_FP_10_0 {  }

}
