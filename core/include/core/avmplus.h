/* -*- Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


#ifndef __avmplus__
#define __avmplus__

/*! \mainpage AVM+ Documentation
 *
 * \section intro Introduction
 *
 * AVM+ is the ActionScript Virtual Machine
 *
 * AVM+ offers an order of magnitude performance increase over
 * the "Classic AVM" in Flash Player 7.  Our performance target is 10X.
 *
 * AVM+ implements ActionScript 3.0, the new version of the ActionScript
 * language that is based on ECMAScript, 3rd Edition (ES3) and
 * ECMAScript for XML (E4X), and which also incorporates many
 * extensions to those languages, including packages, classes, interfaces,
 * and optional type annotations.
 *
 * AVM+ is also built for modularity.  It will be part of the Flash Player,
 * but is a self-contained module which can be incorporated into other
 * programs with ease.
 *
 * \section usage Using This Document
 *
 * This documentation is a reference manual for C++ developers working
 * with AVM+, either in the context of the Flash Player or in another
 * application.  It can be useful for developers enhancing AVM+
 * itself, or for developer who wish to understand its internals
 * in order to better interface with it.
 *
 * \section begin Where To Begin
 *
 * The avmplus::AvmCore class is the main entry point of the
 * AVM+ virtual machine, and is probably a good place to start
 * when trying to comprehend the codebase.
 *
 * \section contact Who To Contact
 *
 * For questions about AVM+, contact information, and so on please see:
 *
 * https://developer.mozilla.org/En/Tamarin
 */

#include "AVMPI.h"
#include "vmbase.h"

#include "../../src/avmbuild.h"       // old-style configuration, may disappear, handles a few things not yet handled by the feature system
#include "atom.h"
#include "../../src/atom-inlines.h"
#include "../generated/avmplus-tracers.h"
#include "GCTypes.h"
#include "../../src/avmplusVersion.h"
#include "../../src/AvmLog.h"
#include "../../src/ActionBlockConstants.h"
#include "../../src/wopcodes.h"
#include "../../generated/ErrorConstants.h"
#include "../../src/NativeObjectHelpers.h"

using namespace avmplus::AtomConstants;
using namespace avmplus::ActionBlockConstants;
using namespace avmplus::ErrorConstants;

/**
 * Incomplete class definitions for everything in AVM+
 */
namespace avmplus
{
    class AbcEnv;
    class AbcParser;
    class Accessor;
    class Aggregate;
    class ArrayClass;
    class ArrayObject;
    class Atan2Method;
    class AvmCore;
    class AvmPlusScriptableObject;
    class MethodFrame;
    class BooleanClass;
    class BuiltinTraits;
    class BugCompatibility;
    class ByteArrayClass;
    class ByteArrayObject;
    class CallStackNode;
    class ClassClass;
    class ClassClosure;
    class Closure;
    class CodeContext;
    class CompiledRegExp;
    class ConditionObject;
    class Console;
    class D2A;
    class Date;
    class DataInput;
    class DataOutput;
    class DateClass;
    class DateObject;
    class Debugger;
#ifdef DEBUGGER
    class DebuggerMethodInfo;
#endif
    class DescribeTypeClass;
    class Domain;
    class DomainEnv;
    class DomainMgr;
    class E4XNode;
    class EnterSafepointManager;
    class ErrorClass;
    class ErrorObject;
    class Exception;
    class ExceptionFrame;
    class ExceptionHandler;
    class ExceptionHandlerTable;
    class FixedBitSet;
    class FrameState;
    class FunctionObject;
    class HeapHashtable;
    class HeapMultiname;
    class InlineHashtable;
    class IntVectorObject;
#ifdef VMCFG_FLOAT
    class FloatVectorObject;
#endif    
    class Isolate;
    class DoubleVectorObject;
    class UIntVectorObject;
    class ObjectVectorObject;
    class JSONClass;
    class LinkObject;
    class MathClass;
    class MathUtils;
    class MethodClosure;
    class MethodEnv;
    class MethodInfo;
    class MethodSignature;
    class Multiname;
    class MutexObject;
    class Namespace;
    class NamespaceSet;
    class NamespaceClass;
    class NativeInitializer;
    struct NativeMethodInfo;
    class NumberClass;
    class IntClass;
    class UIntClass;
    class OSDep;
    class ObjectClass;
    class OutputStream;
    class PoolObject;
    class PrintWriter;
    class Profiler;
    class ProxyClass;
    class ProxyObject;
    class RegExpClass;
    class RegExpObject;
    class Sampler;
    class ScopeChain;
    class ScopeTypeChain;
    class ScriptBuffer;
    class ScriptEnv;
    class ScriptObject;
    class StackTrace;
    class StringBuffer;
    class StringClass;
    class String;
    class Toplevel;
    class Traits;
    class TraitsBindings;
    class TraitsMetadata;
#ifdef VMCFG_WORDCODE
    class WordcodeTranslator;
    class WordcodeEmitter;
#endif
    class UnicodeUtils;
    class FrameValue;
    class Verifier;
    class VTable;
    class VoidClass;
    class WeakMethodClosure;
    class XMLClass;
    class XMLListClass;
    class XMLObject;
    class XMLListObject;
    class QNameClass;
    class QNameObject;
    class XMLParser;
    class XMLTag;
    class DictionaryClass;
    class DictionaryObject;
    class ObjectOutputClass;
    class ObjectOutputObject;
    class ObjectInputClass;
    class ObjectInputObject;
    class DynamicPropertyOutputClass;
    class DynamicPropertyOutputObject;

    template<class TLIST, uintptr_t align> class VectorAccessor;

    struct WordOpcodeAttr;

    typedef Traits* Traitsp;
    // Stringp and Namespacep should be const, but RCObject doens't allow it yet
    typedef String* Stringp;
    typedef Namespace* Namespacep;
    typedef const NamespaceSet* NamespaceSetp;
    typedef const TraitsBindings* TraitsBindingsp;
    typedef const TraitsMetadata* TraitsMetadatap;
    typedef const MethodSignature* MethodSignaturep;

    typedef struct FramePtr_* FramePtr;
}

namespace halfmoon
{
    class JitFriend; // Bridge for encapsulating private access from halfmoon
}

#ifdef VMCFG_AOT
struct ABCInfo;
#endif

#ifdef VMCFG_FLOAT
#   ifndef FLOAT_ONLY
#       define FLOAT_ONLY(...) __VA_ARGS__
#       define IFFLOAT(a,b)  a
#   endif
#else 
#   ifndef FLOAT_ONLY
#       define FLOAT_ONLY(...)
#       define IFFLOAT(a,b)  b
#   endif
#endif

#include "../../src/avm.h"

#include "MMgc.h"

namespace avmplus
{
    typedef MMgc::LeafVector<Traits*, MMgc::GC::kZero> UnscannedTraitsArray;
    typedef MMgc::LeafVector<uint64_t, MMgc::GC::kZero> U64Array;
}

#include "../../src/QCache.h"
#include "../../src/BigInteger.h"
#include "../../src/d2a.h"
#include "../../src/MathUtils.h"
#include "../../src/UnicodeUtils.h"
#include "../../src/OSDep.h"
#include "../../src/OutputStream.h"
#include "../../src/ScriptBuffer.h"
#include "../../src/avmplusList.h"
#include "../../src/avmplusStack.h"
#include "../../src/avmplusContainer.h"
#include "../../src/SortedMap.h"
#include "../../src/BitSet.h"
#include "../../src/AvmPlusScriptableObject.h"
#include "../../generated/api-versions.h"
#include "../../src/AtomWriteBarrier.h"
#include "../../src/Namespace.h"
#include "../../src/StringObject.h"
#include "../../src/MultinameHashtable.h"
#include "../../src/PrintWriter.h"
#include "../../src/BuiltinTraits.h"
#include "../../src/NamespaceSet.h"
#include "../../src/Multiname.h"
#include "../../src/Sampler.h"
#include "../nanojit/njconfig.h"
#include "../../src/Coder.h"
#include "../AVMPI/float4Support.h"
#include "../../src/exec.h"
#include "../../src/Isolate.h"
#include "../../src/AvmCore.h"
#include "../../src/avmplusHashtable.h"
#include "../../src/Traits.h"
#include "../../src/VTable.h"
#include "../../src/ScriptObject.h"
#include "../../src/NativeFunction.h"
#include "../../src/BuiltinNatives.h"
#include "../../src/WordcodeTranslator.h"
#include "../../src/WordcodeEmitter.h"
#include "../../src/MethodInfo.h"
#include "../../src/PoolObject.h"
#include "../../src/AbcEnv.h"
#include "../../src/TraitsIterator.h"
#include "../../src/ScopeChain.h"
#include "../../src/MethodEnv.h"
#include "../../src/CodeContext.h"
#include "../../src/avmplusProfiler.h"
#include "../../src/StringBuffer.h"
#include "../../src/FrameState.h"
#include "../../src/Verifier.h"
#include "../../src/ClassClosure.h"
#include "../../src/ClassClass.h"
#include "../../src/FunctionClass.h"
#include "../../src/MethodClosure.h"
#include "../../src/StackTrace.h"
#include "../../src/Exception.h"
#include "../../src/MethodInfo.h"
#include "../../src/NamespaceClass.h"
#include "../../src/ArrayObject.h"
#include "../../src/MethodClosure.h"
#include "../../src/BooleanClass.h"
#include "../../src/NumberClass.h"
#include "../../src/IntClass.h"
#ifdef VMCFG_FLOAT
#include "../../src/FloatClass.h"
#include "../../src/Float4Class.h"
#endif
#include "../../src/ArrayClass.h"
#include "../../src/ObjectClass.h"
#include "../../src/StringClass.h"
#include "../../src/Date.h"
#include "../../src/DateClass.h"
#include "../../src/DateObject.h"
#include "../../src/DescribeTypeClass.h"
#include "../../src/Domain.h"
#include "../../src/DomainEnv.h"
#include "../../src/DomainMgr.h"
#include "../../src/ErrorClass.h"
#include "../../src/MathClass.h"
#ifdef VMCFG_EVAL
#include "eval-avmplus.h"
#endif
#include "../../src/DataIO.h"
#include "../../src/Toplevel.h"
#include "../../src/VectorClass.h"
#include "../../src/AbcParser.h"
#include "../../src/JSONClass.h"
#include "../../src/RegExpClass.h"
#include "../../src/RegExpObject.h"
#include "../../src/XMLClass.h"
#include "../../src/XMLListClass.h"
#include "../../src/XMLObject.h"
#include "../../src/XMLListObject.h"
#include "../../src/XMLParser16.h"
#include "../../src/avmplusDebugger.h"
#include "../../src/E4XNode.h"
#include "../../src/instr.h"
#ifdef VMCFG_AOT
#include "AOTCompiler.h"
#endif
#include "../../src/ByteArrayGlue.h"
#include "../../src/ProxyGlue.h"
#include "../../src/DictionaryGlue.h"
#include "../../src/ObjectIO.h"
#include "../../src/AvmSerializer.h"
#include "ITelemetry.h"
#include "../../src/ConcurrencyGlue.h"

// Some unusual test cases for the exact-tracer script

#include "../../src/ExactGCTests.h"

#include "../../generated/builtin-classes.hh"

// inline implementations

#include "../../src/AtomWriteBarrier-inlines.h"
#include "../../src/AbcEnv-inlines.h"
#include "../../src/AbcParser-inlines.h"
#include "../../src/ArrayObject-inlines.h"
#include "../../src/AvmCore-inlines.h"
#include "../../src/avmplusHashtable-inlines.h"
#include "../../src/avmplusList-inlines.h"
#include "../../src/ClassClosure-inlines.h"
#include "../../src/Coder-inlines.h"
#include "../../src/E4XNode-inlines.h"
#include "../../src/exec-inlines.h"
#include "../../src/FrameState-inlines.h"
#include "../../src/instr-inlines.h"
#include "../../src/Isolate-inlines.h"
#include "../../src/MathUtils-inlines.h"
#include "../../src/MethodEnv-inlines.h"
#include "../../src/MethodInfo-inlines.h"
#include "../../src/Multiname-inlines.h"
#include "../../src/MultinameHashtable-inlines.h"
#include "../../src/NamespaceSet-inlines.h"
#include "../../src/PoolObject-inlines.h"
#include "../../src/ScopeChain-inlines.h"
#include "../../src/ScriptObject-inlines.h"
#include "../../src/Toplevel-inlines.h"
#include "../../src/Traits-inlines.h"
#include "../../src/Verifier-inlines.h"
#include "../../src/VectorClass-inlines.h"
#include "../../src/VTable-inlines.h"

#endif /* __avmplus__ */
