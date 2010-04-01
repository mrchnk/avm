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
 * The Original Code is [Open Source Virtual Machine].
 *
 * The Initial Developer of the Original Code is
 * Adobe System Incorporated.
 * Portions created by the Initial Developer are Copyright (C) 2010
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
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
 * ***** END LICENSE BLOCK *****
*
*
* See http://bugzilla.mozilla.org/show_bug.cgi?id=538107
*
*/
//-----------------------------------------------------------------------------



startTest();
// ED B0 80 = UTF-8 for 0xDC00
// ED A0 80 = UTF-8 for 0xD800
// 0xDC00 0xD800 is an invalid UTF-16 sequence
var s = "%ED%B0%80%ED%A0%80";


err = "no error";
// looking for URIError: Error #1052: Invalid URI passed to decodeURIComponent function.
try {
    decodeURIComponent(s);
} catch (e) {
    err = grabError(e, e.toString());
} finally {
    AddTestCase("decodeURIComponent", "Error #1052", err );
}


err = "no error";
// looking for URIError: Error #1052: Invalid URI passed to decodeURI function.
try {
    decodeURI(s);
} catch (e) {
    err = grabError(e, e.toString());
} finally {
    AddTestCase("decodeURI", "Error #1052", err );
}


test();
