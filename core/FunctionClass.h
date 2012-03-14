/* -*- Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is [Open Source Virtual Machine.].
 *
 * The Initial Developer of the Original Code is
 * Adobe System Incorporated.
 * Portions created by the Initial Developer are Copyright (C) 2004-2006
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Adobe AS3 Team
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

#ifndef __avmplus_FunctionClass__
#define __avmplus_FunctionClass__


namespace avmplus
{
    /**
     * class Function
     */
    class GC_AS3_EXACT(FunctionClass, ClassClosure)
    {
    protected:
        FunctionClass(VTable* cvtable);
    public:
        REALLY_INLINE static FunctionClass* create(MMgc::GC* gc, VTable* cvtable)
        {
            return new (gc, MMgc::kExact, cvtable->getExtraSize()) FunctionClass(cvtable);
        }

        Atom call(int argc, Atom* argv)
        {
            return construct(argc,argv);
        }

    // ------------------------ DATA SECTION BEGIN
    private:
        GC_NO_DATA(FunctionClass)

        DECLARE_SLOTS_FunctionClass;
    // ------------------------ DATA SECTION END
    };

    class GC_AS3_EXACT(FunctionObject, ClassClosure)
    {
    protected:
        FunctionObject(VTable* cvtable, MethodEnv* call);

    public:
        REALLY_INLINE static FunctionObject* create(MMgc::GC* gc, VTable* vtable, MethodEnv* call)
        {
            return new (gc, MMgc::kExact, vtable->getExtraSize()) FunctionObject(vtable, call);
        }

        /** Implements ScriptObject::call called directly via ptr */
        static Atom callFunction(FunctionObject*, int argc, Atom* argv);

        // AS3 native methods
        int32_t get_length();
        Atom AS3_call(Atom thisAtom, Atom *argv, int argc);
        Atom AS3_apply(Atom thisAtom, Atom argArray);

        // ScriptObject method overrides
#if defined(DEBUGGER) || defined(VMCFG_AOT)
        virtual MethodEnv* getCallMethodEnv();
#endif
        virtual Atom call(int argc, Atom* argv); // overrides ClassClosure.call, ScriptObject.call
        virtual CodeContext* getFunctionCodeContext() const;
        virtual Stringp implToString() const;
    protected:
        virtual Atom get_coerced_receiver(Atom a) const; // called by AS3_call/apply
    private:
        /** Implements get_coerced_receiver specifically for concrete FunctionObject instances */
        Atom getFunctionReceiver(Atom a) const;

    // ------------------------ DATA SECTION BEGIN
    public:
        FunctionProc m_call_ptr; // stub to directly invoke this function.

    protected:
        GC_DATA_BEGIN(FunctionObject)
        GCMember<MethodEnv> GC_POINTER(m_callEnv);
        GC_DATA_END(FunctionObject)

    private:
        DECLARE_SLOTS_FunctionObject;
    // ------------------------ DATA SECTION END
    };
}

namespace avm {
using avmplus::FunctionObject;
using avmplus::VTable;
using avmplus::ScriptObject;

/**
 * A HostFunctionObject is the base class for all host-supplied classes that
 * extend AS3 class Function.  Their C++ class must extend FunctionObject via this wrapper.
 */
class HostFunctionObject: public FunctionObject {
public:
    HostFunctionObject(VTable* vtable, ScriptObject* delegate);

    /**
     * callHostFunction() intercepts calls via m_call_ptr, then delegates back to the
     * HostFunctionObject::call virtual function, because HostFunctionObjects do not use
     * the FunctionProc / m_call_ptr protocol.
     */
    static Atom callHostFunction(HostFunctionObject* f, int argc, Atom* args);
};


}

#endif /* __avmplus_FunctionClass__ */
