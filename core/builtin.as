/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was
 * not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


// each class is in its own file, we include them all here
// so they end up in a single script that initializes all
// at once, in the order of includes below.

package {
    include "generated/api-versions.as";
    CONFIG const NO_VMCFG_FLOAT = !CONFIG::VMCFG_FLOAT;
}

include "src/Object.as"
include "src/Class.as"
include "src/Function.as"
include "src/Namespace.as"
include "src/Boolean.as"
include "src/Number.as"
include "src/Float.as"
include "src/String.as"
include "src/Array.as"
include "src/Vector.as"

include "src/actionscript.lang.as"

include "src/DescribeType.as"
include "src/Math.as";
include "src/Error.as";
include "src/Date.as";
include "src/RegExp.as";
include "src/JSON.as";
include "src/XML.as";
include "src/IDataInput.as";
include "src/IDataOutput.as";
include "src/ByteArray.as";
include "src/Proxy.as";
include "src/flash_net_classes.as";
include "src/Dictionary.as";
include "src/IDynamicPropertyOutput.as";
include "src/IDynamicPropertyWriter.as";
include "src/DynamicPropertyOutput.as";
include "src/ObjectInput.as";
include "src/ObjectOutput.as";
include "src/IExternalizable.as";
include "src/ObjectEncoding.as";
include "src/concurrent.as";
include "src/PromiseChannel.as";