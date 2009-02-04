/* -*- Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
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

#ifndef __avmplus_Coder__
#define __avmplus_Coder__

#if defined AVMPLUS_WORD_CODE
  #define FEATURE_TEEWRITER
#else
  #define FEATURE_NULLWRITER
#endif

namespace avmplus
{
	class CoderContext {
	public:
		AvmCore* core;
		CoderContext (AvmCore* core)
			: core(core) 
		{
		}
	};

	class CodeWriter {
	protected:
		CoderContext* ctx;     // the fixed state of the translator
	public:

		CodeWriter (CoderContext* ctx=NULL)
			: ctx (ctx) {
		}

		virtual ~CodeWriter () {}
		virtual void write (FrameState* state, const byte *pc, AbcOpcode opcode) 
		{ 
			(void)state; 
			(void)pc; 
			(void)opcode; 
		}

		virtual void writeOp1(FrameState* state, const byte *pc, AbcOpcode opcode, uint32_t opd1, Traits *type = NULL)
		{
			(void)state;
			(void)pc; 
			(void)opcode; 
			(void)opd1;
			(void)type;
		}


		virtual void writeOp2 (FrameState* state, const byte *pc, AbcOpcode opcode, uint32_t opd1, uint32_t opd2, Traits* type = NULL)
		{
			(void)state;
			(void)pc;
			(void)opcode;
			(void)opd1;
			(void)opd2;
			(void)type;
		}

		virtual void writePrologue(FrameState* state)
		{ 
			(void)state; 
		}

		virtual void writeEpilogue(FrameState* state)
		{ 
			(void)state; 
		}


	};

#if defined FEATURE_TEEWRITER
	class TeeWriter : public CodeWriter {
	public:
		CodeWriter* coder1;  // deleted elsewhere
		CodeWriter* coder2;

		TeeWriter (CoderContext* ctx, CodeWriter* coder1, CodeWriter* coder2);
		~TeeWriter ();
		void write (FrameState* state, const byte* pc, AbcOpcode opcode);
		void writeOp1(FrameState* state, const byte *pc, AbcOpcode opcode, uint32_t opd1, Traits* type = NULL);
		void writeOp2 (FrameState* state, const byte *pc, AbcOpcode opcode, uint32_t opd1, uint32_t opd2, Traits* type = NULL);
		void writePrologue(FrameState* state);
		void writeEpilogue(FrameState* state);
	};
#endif // FEATURE_TEEWRITER

#if defined FEATURE_NULLWRITER
	class NullWriter : public CodeWriter {
	public:
		CodeWriter* coder;       // the next leg of the pipeline

		NullWriter (CoderContext* ctx, CodeWriter* coder);
		~NullWriter ();
		void write (FrameState* state, const byte* pc, AbcOpcode opcode);
		void writeOp1(FrameState* state, const byte *pc, AbcOpcode opcode, uint32_t opd1, Traits *type = NULL);
		void writeOp2 (FrameState* state, const byte *pc, AbcOpcode opcode, uint32_t opd1, uint32_t opd2, Traits* type = NULL);
		void writePrologue(FrameState* state);
		void writeEpilogue(FrameState* state);
	};
#endif // FEATURE_NULLWRITER

}
#endif  /* __avmplus_Coder__ */
