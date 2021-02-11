add_library(core
        generated/avmfeatures.cpp
        src/AbcEnv.cpp
        src/AbcParser.cpp
        src/ActionBlockConstants.cpp
        src/ArrayClass.cpp
        src/ArrayObject.cpp
        src/atom.cpp
        src/AvmCore.cpp
        src/avm.cpp
        src/AvmLog.cpp
        src/avmplusDebugger.cpp
        src/avmplusHashtable.cpp
        src/avmplusList.cpp
        src/BigInteger.cpp
        src/BooleanClass.cpp
        src/BuiltinTraits.cpp
        src/ByteArrayGlue.cpp
        src/CdeclThunk.cpp
        src/ClassClass.cpp
        src/ClassClosure.cpp
        src/CodegenLIR.cpp
        src/Coder.cpp
        src/d2a.cpp
        src/DataIO.cpp
        src/DateClass.cpp
        src/DateObject.cpp
        src/DescribeTypeClass.cpp
        src/Deopt.cpp
        src/Deopt-CL.cpp
        src/Domain.cpp
        src/DomainEnv.cpp
        src/DomainMgr.cpp
        src/E4XNode.cpp
        src/ErrorClass.cpp
        generated/ErrorConstants.cpp
        src/Exception.cpp
        src/exec.cpp
        src/exec-jit.cpp
        src/exec-osr.cpp
        src/exec-verifyall.cpp
        src/FloatClass.cpp
        src/Float4Class.cpp
        src/FrameState.cpp
        src/FunctionClass.cpp
        src/IntClass.cpp
        src/Interpreter.cpp
        src/InvokerCompiler.cpp
        src/JSONClass.cpp
        src/LirHelper.cpp
        src/MathClass.cpp
        src/MathUtils.cpp
        src/MethodClosure.cpp
        src/MethodEnv.cpp
        src/MethodInfo.cpp
        src/Multiname.cpp
        src/MultinameHashtable.cpp
        src/Namespace.cpp
        src/NamespaceClass.cpp
        src/NamespaceSet.cpp
        src/NativeFunction.cpp
        src/NumberClass.cpp
        src/ObjectClass.cpp
        generated/peephole.cpp
        src/PoolObject.cpp
        src/PrintWriter.cpp
        src/PromiseChannelGlue.cpp
        src/ProxyGlue.cpp
        src/QCache.cpp
        src/RegExpClass.cpp
        src/RegExpObject.cpp
        src/Sampler.cpp
        src/ScopeChain.cpp
        src/ScriptBuffer.cpp
        src/ScriptObject.cpp
        src/StackTrace.cpp
        src/StringBuffer.cpp
        src/StringClass.cpp
        src/StringObject.cpp
        src/Toplevel.cpp
        src/Traits.cpp
        src/TypeDescriber.cpp
        src/UnicodeUtils.cpp
        src/VectorClass.cpp
        src/Verifier.cpp
        src/VTable.cpp
        src/WordcodeEmitter.cpp
        src/WordcodeTranslator.cpp
        src/wopcodes.cpp
        src/XMLClass.cpp
        src/XMLListClass.cpp
        src/XMLListObject.cpp
        src/XMLObject.cpp
        src/XMLParser16.cpp
        src/Date.cpp
        src/AbcData.cpp
        src/AvmPlusScriptableObject.cpp
        src/instr.cpp
        src/DictionaryGlue.cpp
        src/ObjectIO.cpp
        src/AvmSerializer.cpp
        src/ConcurrencyGlue.cpp
        src/Isolate.cpp)

include(nativegen)
include(apivergen)

target_link_libraries(core AVMPI generated MMgc pcre lzma nanojit zlib)
target_include_directories(core
        PRIVATE
        src generated include/core
        INTERFACE
        include)

asc_add_command(builtin.as BUILTIN_ABC ASC_ARGUMENTS -md -builtin -apiversioning -config CONFIG::VMCFG_FLOAT=false)
nativegen(${BUILTIN_ABC} generated NATIVEGENS)
apivergen(api-versions.xml generated APIVERGENS)

add_custom_target(core_generated
        DEPENDS ${BUILTIN_ABC} ${NATIVEGENS} ${APIVERGENS})

set(BUILTIN_ABC ${BUILTIN_ABC} PARENT_SCOPE)