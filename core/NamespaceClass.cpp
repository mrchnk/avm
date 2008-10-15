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


#include "avmplus.h"

namespace avmplus
{
	BEGIN_NATIVE_MAP(NamespaceClass)
		NATIVE_METHOD_CAST(Namespace, Namespace_prefix_get, Namespace::getPrefix)
		NATIVE_METHOD_CAST(Namespace, Namespace_uri_get, Namespace::getURI)
	END_NATIVE_MAP()

	NamespaceClass::NamespaceClass(VTable* cvtable)
		: ClassClosure(cvtable)
	{
		toplevel()->namespaceClass = this;
		AvmAssert(traits()->getSizeOfInstance() == sizeof(NamespaceClass));
		createVanillaPrototype();
	}


	// this = argv[0] (ignored)
	// arg1 = argv[1]
	// argN = argv[argc]
	Atom NamespaceClass::construct(int argc, Atom* argv)
	{
		AvmCore* core = this->core();

		// See E4X 13.2.2, pg 65
		if (argc < 1)
			return core->newNamespace(core->kEmptyString)->atom();
		else if (argc == 1)
			return core->newNamespace(argv[1])->atom();
		else
		{
			// Rhino throws an error when prefix is specified and uri is not a valid string
			String *p = core->string (argv[1]);
			String *u = core->string (argv[2]);
			if (p->length() && !u->length())
			{
				toplevel()->throwTypeError(kXMLNamespaceWithPrefixAndNoURI, p);
			}

			return core->newNamespace(argv[1], argv[2])->atom();
		}
	}

	// this = argv[0] (ignored)
	// arg1 = argv[1]
	// argN = argv[argc]
	Atom NamespaceClass::call(int argc, Atom* argv)
	{
		if ((argc == 1) && (core()->isNamespace(argv[1])))
			return argv[1];
		else
			return construct (argc, argv);
	}
}
