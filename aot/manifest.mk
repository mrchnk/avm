# ***** BEGIN LICENSE BLOCK *****
# Version: MPL 1.1/GPL 2.0/LGPL 2.1
#
# The contents of this file are subject to the Mozilla Public License Version
# 1.1 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
# http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
# The Original Code is [Open Source Virtual Machine].
#
# The Initial Developer of the Original Code is
# Adobe System Incorporated.
# Portions created by the Initial Developer are Copyright (C) 2010
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#
# Alternatively, the contents of this file may be used under the terms of
# either the GNU General Public License Version 2 or later (the "GPL"), or
# the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
# in which case the provisions of the GPL or the LGPL are applicable instead
# of those above. If you wish to allow use of your version of this file only
# under the terms of either the GPL or the LGPL, and not to allow others to
# use your version of this file under the terms of the MPL, indicate your
# decision by deleting the provisions above and replace them with the notice
# and other provisions required by the GPL or the LGPL. If you do not delete
# the provisions above, a recipient may use your version of this file under
# the terms of any one of the MPL, the GPL or the LGPL.
#
# ***** END LICENSE BLOCK *****

STATIC_LIBRARIES += aot
aot_BUILD_ALL = 1
aot_CXXSRCS := \
    $(curdir)/AOTCompiler.cpp \
    $(curdir)/AOTStubs.cpp \
    $(NULL)

ifdef ENABLE_SHELL
shell_STATIC_LIBRARIES += aot
endif

numstubs = 1000
stubcpps := $(curdir)/AOTStubs-00000.cpp \
    $(curdir)/AOTStubs-00001.cpp \
    $(curdir)/AOTStubs-00002.cpp \
    $(curdir)/AOTStubs-00003.cpp \
    $(curdir)/AOTStubs-00004.cpp \
    $(curdir)/AOTStubs-00005.cpp \
    $(curdir)/AOTStubs-00006.cpp \
    $(curdir)/AOTStubs-00007.cpp \
    $(curdir)/AOTStubs-00008.cpp \
    $(curdir)/AOTStubs-00009.cpp \
    $(curdir)/AOTStubs-00010.cpp \
    $(curdir)/AOTStubs-00011.cpp \
    $(curdir)/AOTStubs-00012.cpp \
    $(curdir)/AOTStubs-00013.cpp \
    $(curdir)/AOTStubs-00014.cpp \
    $(curdir)/AOTStubs-00015.cpp \
    $(curdir)/AOTStubs-00016.cpp \
    $(curdir)/AOTStubs-00017.cpp \
    $(curdir)/AOTStubs-00018.cpp \
    $(curdir)/AOTStubs-00019.cpp \
    $(curdir)/AOTStubs-00020.cpp \
    $(curdir)/AOTStubs-00021.cpp \
    $(curdir)/AOTStubs-00022.cpp \
    $(curdir)/AOTStubs-00023.cpp \
    $(curdir)/AOTStubs-00024.cpp \
    $(curdir)/AOTStubs-00025.cpp \
    $(curdir)/AOTStubs-00026.cpp \
    $(curdir)/AOTStubs-00027.cpp \
    $(curdir)/AOTStubs-00028.cpp \
    $(curdir)/AOTStubs-00029.cpp \
    $(curdir)/AOTStubs-00030.cpp \
    $(curdir)/AOTStubs-00031.cpp \
    $(curdir)/AOTStubs-00032.cpp \
    $(curdir)/AOTStubs-00033.cpp \
    $(curdir)/AOTStubs-00034.cpp \
    $(curdir)/AOTStubs-00035.cpp \
    $(curdir)/AOTStubs-00036.cpp \
    $(curdir)/AOTStubs-00037.cpp \
    $(curdir)/AOTStubs-00038.cpp \
    $(curdir)/AOTStubs-00039.cpp \
    $(curdir)/AOTStubs-00040.cpp \
    $(curdir)/AOTStubs-00041.cpp \
    $(curdir)/AOTStubs-00042.cpp \
    $(curdir)/AOTStubs-00043.cpp \
    $(curdir)/AOTStubs-00044.cpp \
    $(curdir)/AOTStubs-00045.cpp \
    $(curdir)/AOTStubs-00046.cpp \
    $(curdir)/AOTStubs-00047.cpp \
    $(curdir)/AOTStubs-00048.cpp \
    $(curdir)/AOTStubs-00049.cpp \
    $(curdir)/AOTStubs-00050.cpp \
    $(curdir)/AOTStubs-00051.cpp \
    $(curdir)/AOTStubs-00052.cpp \
    $(curdir)/AOTStubs-00053.cpp \
    $(curdir)/AOTStubs-00054.cpp \
    $(curdir)/AOTStubs-00055.cpp \
    $(curdir)/AOTStubs-00056.cpp \
    $(curdir)/AOTStubs-00057.cpp \
    $(curdir)/AOTStubs-00058.cpp \
    $(curdir)/AOTStubs-00059.cpp \
    $(curdir)/AOTStubs-00060.cpp \
    $(curdir)/AOTStubs-00061.cpp \
    $(curdir)/AOTStubs-00062.cpp \
    $(curdir)/AOTStubs-00063.cpp \
    $(curdir)/AOTStubs-00064.cpp \
    $(curdir)/AOTStubs-00065.cpp \
    $(curdir)/AOTStubs-00066.cpp \
    $(curdir)/AOTStubs-00067.cpp \
    $(curdir)/AOTStubs-00068.cpp \
    $(curdir)/AOTStubs-00069.cpp \
    $(curdir)/AOTStubs-00070.cpp \
    $(curdir)/AOTStubs-00071.cpp \
    $(curdir)/AOTStubs-00072.cpp \
    $(curdir)/AOTStubs-00073.cpp \
    $(curdir)/AOTStubs-00074.cpp \
    $(curdir)/AOTStubs-00075.cpp \
    $(curdir)/AOTStubs-00076.cpp \
    $(curdir)/AOTStubs-00077.cpp \
    $(curdir)/AOTStubs-00078.cpp \
    $(curdir)/AOTStubs-00079.cpp \
    $(curdir)/AOTStubs-00080.cpp \
    $(curdir)/AOTStubs-00081.cpp \
    $(curdir)/AOTStubs-00082.cpp \
    $(curdir)/AOTStubs-00083.cpp \
    $(curdir)/AOTStubs-00084.cpp \
    $(curdir)/AOTStubs-00085.cpp \
    $(curdir)/AOTStubs-00086.cpp \
    $(curdir)/AOTStubs-00087.cpp \
    $(curdir)/AOTStubs-00088.cpp \
    $(curdir)/AOTStubs-00089.cpp \
    $(curdir)/AOTStubs-00090.cpp \
    $(curdir)/AOTStubs-00091.cpp \
    $(curdir)/AOTStubs-00092.cpp \
    $(curdir)/AOTStubs-00093.cpp \
    $(curdir)/AOTStubs-00094.cpp \
    $(curdir)/AOTStubs-00095.cpp \
    $(curdir)/AOTStubs-00096.cpp \
    $(curdir)/AOTStubs-00097.cpp \
    $(curdir)/AOTStubs-00098.cpp \
    $(curdir)/AOTStubs-00099.cpp \
    $(curdir)/AOTStubs-00100.cpp \
    $(curdir)/AOTStubs-00101.cpp \
    $(curdir)/AOTStubs-00102.cpp \
    $(curdir)/AOTStubs-00103.cpp \
    $(curdir)/AOTStubs-00104.cpp \
    $(curdir)/AOTStubs-00105.cpp \
    $(curdir)/AOTStubs-00106.cpp \
    $(curdir)/AOTStubs-00107.cpp \
    $(curdir)/AOTStubs-00108.cpp \
    $(curdir)/AOTStubs-00109.cpp \
    $(curdir)/AOTStubs-00110.cpp \
    $(curdir)/AOTStubs-00111.cpp \
    $(curdir)/AOTStubs-00112.cpp \
    $(curdir)/AOTStubs-00113.cpp \
    $(curdir)/AOTStubs-00114.cpp \
    $(curdir)/AOTStubs-00115.cpp \
    $(curdir)/AOTStubs-00116.cpp \
    $(curdir)/AOTStubs-00117.cpp \
    $(curdir)/AOTStubs-00118.cpp \
    $(curdir)/AOTStubs-00119.cpp \
    $(curdir)/AOTStubs-00120.cpp \
    $(curdir)/AOTStubs-00121.cpp \
    $(curdir)/AOTStubs-00122.cpp \
    $(curdir)/AOTStubs-00123.cpp \
    $(curdir)/AOTStubs-00124.cpp \
    $(curdir)/AOTStubs-00125.cpp \
    $(curdir)/AOTStubs-00126.cpp \
    $(curdir)/AOTStubs-00127.cpp \
    $(curdir)/AOTStubs-00128.cpp \
    $(curdir)/AOTStubs-00129.cpp \
    $(curdir)/AOTStubs-00130.cpp \
    $(curdir)/AOTStubs-00131.cpp \
    $(curdir)/AOTStubs-00132.cpp \
    $(curdir)/AOTStubs-00133.cpp \
    $(curdir)/AOTStubs-00134.cpp \
    $(curdir)/AOTStubs-00135.cpp \
    $(curdir)/AOTStubs-00136.cpp \
    $(curdir)/AOTStubs-00137.cpp \
    $(curdir)/AOTStubs-00138.cpp \
    $(curdir)/AOTStubs-00139.cpp \
    $(curdir)/AOTStubs-00140.cpp \
    $(curdir)/AOTStubs-00141.cpp \
    $(curdir)/AOTStubs-00142.cpp \
    $(curdir)/AOTStubs-00143.cpp \
    $(curdir)/AOTStubs-00144.cpp \
    $(curdir)/AOTStubs-00145.cpp \
    $(curdir)/AOTStubs-00146.cpp \
    $(curdir)/AOTStubs-00147.cpp \
    $(curdir)/AOTStubs-00148.cpp \
    $(curdir)/AOTStubs-00149.cpp \
    $(curdir)/AOTStubs-00150.cpp \
    $(curdir)/AOTStubs-00151.cpp \
    $(curdir)/AOTStubs-00152.cpp \
    $(curdir)/AOTStubs-00153.cpp \
    $(curdir)/AOTStubs-00154.cpp \
    $(curdir)/AOTStubs-00155.cpp \
    $(curdir)/AOTStubs-00156.cpp \
    $(curdir)/AOTStubs-00157.cpp \
    $(curdir)/AOTStubs-00158.cpp \
    $(curdir)/AOTStubs-00159.cpp \
    $(curdir)/AOTStubs-00160.cpp \
    $(curdir)/AOTStubs-00161.cpp \
    $(curdir)/AOTStubs-00162.cpp \
    $(curdir)/AOTStubs-00163.cpp \
    $(curdir)/AOTStubs-00164.cpp \
    $(curdir)/AOTStubs-00165.cpp \
    $(curdir)/AOTStubs-00166.cpp \
    $(curdir)/AOTStubs-00167.cpp \
    $(curdir)/AOTStubs-00168.cpp \
    $(curdir)/AOTStubs-00169.cpp \
    $(curdir)/AOTStubs-00170.cpp \
    $(curdir)/AOTStubs-00171.cpp \
    $(curdir)/AOTStubs-00172.cpp \
    $(curdir)/AOTStubs-00173.cpp \
    $(curdir)/AOTStubs-00174.cpp \
    $(curdir)/AOTStubs-00175.cpp \
    $(curdir)/AOTStubs-00176.cpp \
    $(curdir)/AOTStubs-00177.cpp \
    $(curdir)/AOTStubs-00178.cpp \
    $(curdir)/AOTStubs-00179.cpp \
    $(curdir)/AOTStubs-00180.cpp \
    $(curdir)/AOTStubs-00181.cpp \
    $(curdir)/AOTStubs-00182.cpp \
    $(curdir)/AOTStubs-00183.cpp \
    $(curdir)/AOTStubs-00184.cpp \
    $(curdir)/AOTStubs-00185.cpp \
    $(curdir)/AOTStubs-00186.cpp \
    $(curdir)/AOTStubs-00187.cpp \
    $(curdir)/AOTStubs-00188.cpp \
    $(curdir)/AOTStubs-00189.cpp \
    $(curdir)/AOTStubs-00190.cpp \
    $(curdir)/AOTStubs-00191.cpp \
    $(curdir)/AOTStubs-00192.cpp \
    $(curdir)/AOTStubs-00193.cpp \
    $(curdir)/AOTStubs-00194.cpp \
    $(curdir)/AOTStubs-00195.cpp \
    $(curdir)/AOTStubs-00196.cpp \
    $(curdir)/AOTStubs-00197.cpp \
    $(curdir)/AOTStubs-00198.cpp \
    $(curdir)/AOTStubs-00199.cpp \
    $(curdir)/AOTStubs-00200.cpp \
    $(curdir)/AOTStubs-00201.cpp \
    $(curdir)/AOTStubs-00202.cpp \
    $(curdir)/AOTStubs-00203.cpp \
    $(curdir)/AOTStubs-00204.cpp \
    $(curdir)/AOTStubs-00205.cpp \
    $(curdir)/AOTStubs-00206.cpp \
    $(curdir)/AOTStubs-00207.cpp \
    $(curdir)/AOTStubs-00208.cpp \
    $(curdir)/AOTStubs-00209.cpp \
    $(curdir)/AOTStubs-00210.cpp \
    $(curdir)/AOTStubs-00211.cpp \
    $(curdir)/AOTStubs-00212.cpp \
    $(curdir)/AOTStubs-00213.cpp \
    $(curdir)/AOTStubs-00214.cpp \
    $(curdir)/AOTStubs-00215.cpp \
    $(curdir)/AOTStubs-00216.cpp \
    $(curdir)/AOTStubs-00217.cpp \
    $(curdir)/AOTStubs-00218.cpp \
    $(curdir)/AOTStubs-00219.cpp \
    $(curdir)/AOTStubs-00220.cpp \
    $(curdir)/AOTStubs-00221.cpp \
    $(curdir)/AOTStubs-00222.cpp \
    $(curdir)/AOTStubs-00223.cpp \
    $(curdir)/AOTStubs-00224.cpp \
    $(curdir)/AOTStubs-00225.cpp \
    $(curdir)/AOTStubs-00226.cpp \
    $(curdir)/AOTStubs-00227.cpp \
    $(curdir)/AOTStubs-00228.cpp \
    $(curdir)/AOTStubs-00229.cpp \
    $(curdir)/AOTStubs-00230.cpp \
    $(curdir)/AOTStubs-00231.cpp \
    $(curdir)/AOTStubs-00232.cpp \
    $(curdir)/AOTStubs-00233.cpp \
    $(curdir)/AOTStubs-00234.cpp \
    $(curdir)/AOTStubs-00235.cpp \
    $(curdir)/AOTStubs-00236.cpp \
    $(curdir)/AOTStubs-00237.cpp \
    $(curdir)/AOTStubs-00238.cpp \
    $(curdir)/AOTStubs-00239.cpp \
    $(curdir)/AOTStubs-00240.cpp \
    $(curdir)/AOTStubs-00241.cpp \
    $(curdir)/AOTStubs-00242.cpp \
    $(curdir)/AOTStubs-00243.cpp \
    $(curdir)/AOTStubs-00244.cpp \
    $(curdir)/AOTStubs-00245.cpp \
    $(curdir)/AOTStubs-00246.cpp \
    $(curdir)/AOTStubs-00247.cpp \
    $(curdir)/AOTStubs-00248.cpp \
    $(curdir)/AOTStubs-00249.cpp \
    $(curdir)/AOTStubs-00250.cpp \
    $(curdir)/AOTStubs-00251.cpp \
    $(curdir)/AOTStubs-00252.cpp \
    $(curdir)/AOTStubs-00253.cpp \
    $(curdir)/AOTStubs-00254.cpp \
    $(curdir)/AOTStubs-00255.cpp \
    $(curdir)/AOTStubs-00256.cpp \
    $(curdir)/AOTStubs-00257.cpp \
    $(curdir)/AOTStubs-00258.cpp \
    $(curdir)/AOTStubs-00259.cpp \
    $(curdir)/AOTStubs-00260.cpp \
    $(curdir)/AOTStubs-00261.cpp \
    $(curdir)/AOTStubs-00262.cpp \
    $(curdir)/AOTStubs-00263.cpp \
    $(curdir)/AOTStubs-00264.cpp \
    $(curdir)/AOTStubs-00265.cpp \
    $(curdir)/AOTStubs-00266.cpp \
    $(curdir)/AOTStubs-00267.cpp \
    $(curdir)/AOTStubs-00268.cpp \
    $(curdir)/AOTStubs-00269.cpp \
    $(curdir)/AOTStubs-00270.cpp \
    $(curdir)/AOTStubs-00271.cpp \
    $(curdir)/AOTStubs-00272.cpp \
    $(curdir)/AOTStubs-00273.cpp \
    $(curdir)/AOTStubs-00274.cpp \
    $(curdir)/AOTStubs-00275.cpp \
    $(curdir)/AOTStubs-00276.cpp \
    $(curdir)/AOTStubs-00277.cpp \
    $(curdir)/AOTStubs-00278.cpp \
    $(curdir)/AOTStubs-00279.cpp \
    $(curdir)/AOTStubs-00280.cpp \
    $(curdir)/AOTStubs-00281.cpp \
    $(curdir)/AOTStubs-00282.cpp \
    $(curdir)/AOTStubs-00283.cpp \
    $(curdir)/AOTStubs-00284.cpp \
    $(curdir)/AOTStubs-00285.cpp \
    $(curdir)/AOTStubs-00286.cpp \
    $(curdir)/AOTStubs-00287.cpp \
    $(curdir)/AOTStubs-00288.cpp \
    $(curdir)/AOTStubs-00289.cpp \
    $(curdir)/AOTStubs-00290.cpp \
    $(curdir)/AOTStubs-00291.cpp \
    $(curdir)/AOTStubs-00292.cpp \
    $(curdir)/AOTStubs-00293.cpp \
    $(curdir)/AOTStubs-00294.cpp \
    $(curdir)/AOTStubs-00295.cpp \
    $(curdir)/AOTStubs-00296.cpp \
    $(curdir)/AOTStubs-00297.cpp \
    $(curdir)/AOTStubs-00298.cpp \
    $(curdir)/AOTStubs-00299.cpp \
    $(curdir)/AOTStubs-00300.cpp \
    $(curdir)/AOTStubs-00301.cpp \
    $(curdir)/AOTStubs-00302.cpp \
    $(curdir)/AOTStubs-00303.cpp \
    $(curdir)/AOTStubs-00304.cpp \
    $(curdir)/AOTStubs-00305.cpp \
    $(curdir)/AOTStubs-00306.cpp \
    $(curdir)/AOTStubs-00307.cpp \
    $(curdir)/AOTStubs-00308.cpp \
    $(curdir)/AOTStubs-00309.cpp \
    $(curdir)/AOTStubs-00310.cpp \
    $(curdir)/AOTStubs-00311.cpp \
    $(curdir)/AOTStubs-00312.cpp \
    $(curdir)/AOTStubs-00313.cpp \
    $(curdir)/AOTStubs-00314.cpp \
    $(curdir)/AOTStubs-00315.cpp \
    $(curdir)/AOTStubs-00316.cpp \
    $(curdir)/AOTStubs-00317.cpp \
    $(curdir)/AOTStubs-00318.cpp \
    $(curdir)/AOTStubs-00319.cpp \
    $(curdir)/AOTStubs-00320.cpp \
    $(curdir)/AOTStubs-00321.cpp \
    $(curdir)/AOTStubs-00322.cpp \
    $(curdir)/AOTStubs-00323.cpp \
    $(curdir)/AOTStubs-00324.cpp \
    $(curdir)/AOTStubs-00325.cpp \
    $(curdir)/AOTStubs-00326.cpp \
    $(curdir)/AOTStubs-00327.cpp \
    $(curdir)/AOTStubs-00328.cpp \
    $(curdir)/AOTStubs-00329.cpp \
    $(curdir)/AOTStubs-00330.cpp \
    $(curdir)/AOTStubs-00331.cpp \
    $(curdir)/AOTStubs-00332.cpp \
    $(curdir)/AOTStubs-00333.cpp \
    $(curdir)/AOTStubs-00334.cpp \
    $(curdir)/AOTStubs-00335.cpp \
    $(curdir)/AOTStubs-00336.cpp \
    $(curdir)/AOTStubs-00337.cpp \
    $(curdir)/AOTStubs-00338.cpp \
    $(curdir)/AOTStubs-00339.cpp \
    $(curdir)/AOTStubs-00340.cpp \
    $(curdir)/AOTStubs-00341.cpp \
    $(curdir)/AOTStubs-00342.cpp \
    $(curdir)/AOTStubs-00343.cpp \
    $(curdir)/AOTStubs-00344.cpp \
    $(curdir)/AOTStubs-00345.cpp \
    $(curdir)/AOTStubs-00346.cpp \
    $(curdir)/AOTStubs-00347.cpp \
    $(curdir)/AOTStubs-00348.cpp \
    $(curdir)/AOTStubs-00349.cpp \
    $(curdir)/AOTStubs-00350.cpp \
    $(curdir)/AOTStubs-00351.cpp \
    $(curdir)/AOTStubs-00352.cpp \
    $(curdir)/AOTStubs-00353.cpp \
    $(curdir)/AOTStubs-00354.cpp \
    $(curdir)/AOTStubs-00355.cpp \
    $(curdir)/AOTStubs-00356.cpp \
    $(curdir)/AOTStubs-00357.cpp \
    $(curdir)/AOTStubs-00358.cpp \
    $(curdir)/AOTStubs-00359.cpp \
    $(curdir)/AOTStubs-00360.cpp \
    $(curdir)/AOTStubs-00361.cpp \
    $(curdir)/AOTStubs-00362.cpp \
    $(curdir)/AOTStubs-00363.cpp \
    $(curdir)/AOTStubs-00364.cpp \
    $(curdir)/AOTStubs-00365.cpp \
    $(curdir)/AOTStubs-00366.cpp \
    $(curdir)/AOTStubs-00367.cpp \
    $(curdir)/AOTStubs-00368.cpp \
    $(curdir)/AOTStubs-00369.cpp \
    $(curdir)/AOTStubs-00370.cpp \
    $(curdir)/AOTStubs-00371.cpp \
    $(curdir)/AOTStubs-00372.cpp \
    $(curdir)/AOTStubs-00373.cpp \
    $(curdir)/AOTStubs-00374.cpp \
    $(curdir)/AOTStubs-00375.cpp \
    $(curdir)/AOTStubs-00376.cpp \
    $(curdir)/AOTStubs-00377.cpp \
    $(curdir)/AOTStubs-00378.cpp \
    $(curdir)/AOTStubs-00379.cpp \
    $(curdir)/AOTStubs-00380.cpp \
    $(curdir)/AOTStubs-00381.cpp \
    $(curdir)/AOTStubs-00382.cpp \
    $(curdir)/AOTStubs-00383.cpp \
    $(curdir)/AOTStubs-00384.cpp \
    $(curdir)/AOTStubs-00385.cpp \
    $(curdir)/AOTStubs-00386.cpp \
    $(curdir)/AOTStubs-00387.cpp \
    $(curdir)/AOTStubs-00388.cpp \
    $(curdir)/AOTStubs-00389.cpp \
    $(curdir)/AOTStubs-00390.cpp \
    $(curdir)/AOTStubs-00391.cpp \
    $(curdir)/AOTStubs-00392.cpp \
    $(curdir)/AOTStubs-00393.cpp \
    $(curdir)/AOTStubs-00394.cpp \
    $(curdir)/AOTStubs-00395.cpp \
    $(curdir)/AOTStubs-00396.cpp \
    $(curdir)/AOTStubs-00397.cpp \
    $(curdir)/AOTStubs-00398.cpp \
    $(curdir)/AOTStubs-00399.cpp \
    $(curdir)/AOTStubs-00400.cpp \
    $(curdir)/AOTStubs-00401.cpp \
    $(curdir)/AOTStubs-00402.cpp \
    $(curdir)/AOTStubs-00403.cpp \
    $(curdir)/AOTStubs-00404.cpp \
    $(curdir)/AOTStubs-00405.cpp \
    $(curdir)/AOTStubs-00406.cpp \
    $(curdir)/AOTStubs-00407.cpp \
    $(curdir)/AOTStubs-00408.cpp \
    $(curdir)/AOTStubs-00409.cpp \
    $(curdir)/AOTStubs-00410.cpp \
    $(curdir)/AOTStubs-00411.cpp \
    $(curdir)/AOTStubs-00412.cpp \
    $(curdir)/AOTStubs-00413.cpp \
    $(curdir)/AOTStubs-00414.cpp \
    $(curdir)/AOTStubs-00415.cpp \
    $(curdir)/AOTStubs-00416.cpp \
    $(curdir)/AOTStubs-00417.cpp \
    $(curdir)/AOTStubs-00418.cpp \
    $(curdir)/AOTStubs-00419.cpp \
    $(curdir)/AOTStubs-00420.cpp \
    $(curdir)/AOTStubs-00421.cpp \
    $(curdir)/AOTStubs-00422.cpp \
    $(curdir)/AOTStubs-00423.cpp \
    $(curdir)/AOTStubs-00424.cpp \
    $(curdir)/AOTStubs-00425.cpp \
    $(curdir)/AOTStubs-00426.cpp \
    $(curdir)/AOTStubs-00427.cpp \
    $(curdir)/AOTStubs-00428.cpp \
    $(curdir)/AOTStubs-00429.cpp \
    $(curdir)/AOTStubs-00430.cpp \
    $(curdir)/AOTStubs-00431.cpp \
    $(curdir)/AOTStubs-00432.cpp \
    $(curdir)/AOTStubs-00433.cpp \
    $(curdir)/AOTStubs-00434.cpp \
    $(curdir)/AOTStubs-00435.cpp \
    $(curdir)/AOTStubs-00436.cpp \
    $(curdir)/AOTStubs-00437.cpp \
    $(curdir)/AOTStubs-00438.cpp \
    $(curdir)/AOTStubs-00439.cpp \
    $(curdir)/AOTStubs-00440.cpp \
    $(curdir)/AOTStubs-00441.cpp \
    $(curdir)/AOTStubs-00442.cpp \
    $(curdir)/AOTStubs-00443.cpp \
    $(curdir)/AOTStubs-00444.cpp \
    $(curdir)/AOTStubs-00445.cpp \
    $(curdir)/AOTStubs-00446.cpp \
    $(curdir)/AOTStubs-00447.cpp \
    $(curdir)/AOTStubs-00448.cpp \
    $(curdir)/AOTStubs-00449.cpp \
    $(curdir)/AOTStubs-00450.cpp \
    $(curdir)/AOTStubs-00451.cpp \
    $(curdir)/AOTStubs-00452.cpp \
    $(curdir)/AOTStubs-00453.cpp \
    $(curdir)/AOTStubs-00454.cpp \
    $(curdir)/AOTStubs-00455.cpp \
    $(curdir)/AOTStubs-00456.cpp \
    $(curdir)/AOTStubs-00457.cpp \
    $(curdir)/AOTStubs-00458.cpp \
    $(curdir)/AOTStubs-00459.cpp \
    $(curdir)/AOTStubs-00460.cpp \
    $(curdir)/AOTStubs-00461.cpp \
    $(curdir)/AOTStubs-00462.cpp \
    $(curdir)/AOTStubs-00463.cpp \
    $(curdir)/AOTStubs-00464.cpp \
    $(curdir)/AOTStubs-00465.cpp \
    $(curdir)/AOTStubs-00466.cpp \
    $(curdir)/AOTStubs-00467.cpp \
    $(curdir)/AOTStubs-00468.cpp \
    $(curdir)/AOTStubs-00469.cpp \
    $(curdir)/AOTStubs-00470.cpp \
    $(curdir)/AOTStubs-00471.cpp \
    $(curdir)/AOTStubs-00472.cpp \
    $(curdir)/AOTStubs-00473.cpp \
    $(curdir)/AOTStubs-00474.cpp \
    $(curdir)/AOTStubs-00475.cpp \
    $(curdir)/AOTStubs-00476.cpp \
    $(curdir)/AOTStubs-00477.cpp \
    $(curdir)/AOTStubs-00478.cpp \
    $(curdir)/AOTStubs-00479.cpp \
    $(curdir)/AOTStubs-00480.cpp \
    $(curdir)/AOTStubs-00481.cpp \
    $(curdir)/AOTStubs-00482.cpp \
    $(curdir)/AOTStubs-00483.cpp \
    $(curdir)/AOTStubs-00484.cpp \
    $(curdir)/AOTStubs-00485.cpp \
    $(curdir)/AOTStubs-00486.cpp \
    $(curdir)/AOTStubs-00487.cpp \
    $(curdir)/AOTStubs-00488.cpp \
    $(curdir)/AOTStubs-00489.cpp \
    $(curdir)/AOTStubs-00490.cpp \
    $(curdir)/AOTStubs-00491.cpp \
    $(curdir)/AOTStubs-00492.cpp \
    $(curdir)/AOTStubs-00493.cpp \
    $(curdir)/AOTStubs-00494.cpp \
    $(curdir)/AOTStubs-00495.cpp \
    $(curdir)/AOTStubs-00496.cpp \
    $(curdir)/AOTStubs-00497.cpp \
    $(curdir)/AOTStubs-00498.cpp \
    $(curdir)/AOTStubs-00499.cpp \
    $(curdir)/AOTStubs-00500.cpp \
    $(curdir)/AOTStubs-00501.cpp \
    $(curdir)/AOTStubs-00502.cpp \
    $(curdir)/AOTStubs-00503.cpp \
    $(curdir)/AOTStubs-00504.cpp \
    $(curdir)/AOTStubs-00505.cpp \
    $(curdir)/AOTStubs-00506.cpp \
    $(curdir)/AOTStubs-00507.cpp \
    $(curdir)/AOTStubs-00508.cpp \
    $(curdir)/AOTStubs-00509.cpp \
    $(curdir)/AOTStubs-00510.cpp \
    $(curdir)/AOTStubs-00511.cpp \
    $(curdir)/AOTStubs-00512.cpp \
    $(curdir)/AOTStubs-00513.cpp \
    $(curdir)/AOTStubs-00514.cpp \
    $(curdir)/AOTStubs-00515.cpp \
    $(curdir)/AOTStubs-00516.cpp \
    $(curdir)/AOTStubs-00517.cpp \
    $(curdir)/AOTStubs-00518.cpp \
    $(curdir)/AOTStubs-00519.cpp \
    $(curdir)/AOTStubs-00520.cpp \
    $(curdir)/AOTStubs-00521.cpp \
    $(curdir)/AOTStubs-00522.cpp \
    $(curdir)/AOTStubs-00523.cpp \
    $(curdir)/AOTStubs-00524.cpp \
    $(curdir)/AOTStubs-00525.cpp \
    $(curdir)/AOTStubs-00526.cpp \
    $(curdir)/AOTStubs-00527.cpp \
    $(curdir)/AOTStubs-00528.cpp \
    $(curdir)/AOTStubs-00529.cpp \
    $(curdir)/AOTStubs-00530.cpp \
    $(curdir)/AOTStubs-00531.cpp \
    $(curdir)/AOTStubs-00532.cpp \
    $(curdir)/AOTStubs-00533.cpp \
    $(curdir)/AOTStubs-00534.cpp \
    $(curdir)/AOTStubs-00535.cpp \
    $(curdir)/AOTStubs-00536.cpp \
    $(curdir)/AOTStubs-00537.cpp \
    $(curdir)/AOTStubs-00538.cpp \
    $(curdir)/AOTStubs-00539.cpp \
    $(curdir)/AOTStubs-00540.cpp \
    $(curdir)/AOTStubs-00541.cpp \
    $(curdir)/AOTStubs-00542.cpp \
    $(curdir)/AOTStubs-00543.cpp \
    $(curdir)/AOTStubs-00544.cpp \
    $(curdir)/AOTStubs-00545.cpp \
    $(curdir)/AOTStubs-00546.cpp \
    $(curdir)/AOTStubs-00547.cpp \
    $(curdir)/AOTStubs-00548.cpp \
    $(curdir)/AOTStubs-00549.cpp \
    $(curdir)/AOTStubs-00550.cpp \
    $(curdir)/AOTStubs-00551.cpp \
    $(curdir)/AOTStubs-00552.cpp \
    $(curdir)/AOTStubs-00553.cpp \
    $(curdir)/AOTStubs-00554.cpp \
    $(curdir)/AOTStubs-00555.cpp \
    $(curdir)/AOTStubs-00556.cpp \
    $(curdir)/AOTStubs-00557.cpp \
    $(curdir)/AOTStubs-00558.cpp \
    $(curdir)/AOTStubs-00559.cpp \
    $(curdir)/AOTStubs-00560.cpp \
    $(curdir)/AOTStubs-00561.cpp \
    $(curdir)/AOTStubs-00562.cpp \
    $(curdir)/AOTStubs-00563.cpp \
    $(curdir)/AOTStubs-00564.cpp \
    $(curdir)/AOTStubs-00565.cpp \
    $(curdir)/AOTStubs-00566.cpp \
    $(curdir)/AOTStubs-00567.cpp \
    $(curdir)/AOTStubs-00568.cpp \
    $(curdir)/AOTStubs-00569.cpp \
    $(curdir)/AOTStubs-00570.cpp \
    $(curdir)/AOTStubs-00571.cpp \
    $(curdir)/AOTStubs-00572.cpp \
    $(curdir)/AOTStubs-00573.cpp \
    $(curdir)/AOTStubs-00574.cpp \
    $(curdir)/AOTStubs-00575.cpp \
    $(curdir)/AOTStubs-00576.cpp \
    $(curdir)/AOTStubs-00577.cpp \
    $(curdir)/AOTStubs-00578.cpp \
    $(curdir)/AOTStubs-00579.cpp \
    $(curdir)/AOTStubs-00580.cpp \
    $(curdir)/AOTStubs-00581.cpp \
    $(curdir)/AOTStubs-00582.cpp \
    $(curdir)/AOTStubs-00583.cpp \
    $(curdir)/AOTStubs-00584.cpp \
    $(curdir)/AOTStubs-00585.cpp \
    $(curdir)/AOTStubs-00586.cpp \
    $(curdir)/AOTStubs-00587.cpp \
    $(curdir)/AOTStubs-00588.cpp \
    $(curdir)/AOTStubs-00589.cpp \
    $(curdir)/AOTStubs-00590.cpp \
    $(curdir)/AOTStubs-00591.cpp \
    $(curdir)/AOTStubs-00592.cpp \
    $(curdir)/AOTStubs-00593.cpp \
    $(curdir)/AOTStubs-00594.cpp \
    $(curdir)/AOTStubs-00595.cpp \
    $(curdir)/AOTStubs-00596.cpp \
    $(curdir)/AOTStubs-00597.cpp \
    $(curdir)/AOTStubs-00598.cpp \
    $(curdir)/AOTStubs-00599.cpp \
    $(curdir)/AOTStubs-00600.cpp \
    $(curdir)/AOTStubs-00601.cpp \
    $(curdir)/AOTStubs-00602.cpp \
    $(curdir)/AOTStubs-00603.cpp \
    $(curdir)/AOTStubs-00604.cpp \
    $(curdir)/AOTStubs-00605.cpp \
    $(curdir)/AOTStubs-00606.cpp \
    $(curdir)/AOTStubs-00607.cpp \
    $(curdir)/AOTStubs-00608.cpp \
    $(curdir)/AOTStubs-00609.cpp \
    $(curdir)/AOTStubs-00610.cpp \
    $(curdir)/AOTStubs-00611.cpp \
    $(curdir)/AOTStubs-00612.cpp \
    $(curdir)/AOTStubs-00613.cpp \
    $(curdir)/AOTStubs-00614.cpp \
    $(curdir)/AOTStubs-00615.cpp \
    $(curdir)/AOTStubs-00616.cpp \
    $(curdir)/AOTStubs-00617.cpp \
    $(curdir)/AOTStubs-00618.cpp \
    $(curdir)/AOTStubs-00619.cpp \
    $(curdir)/AOTStubs-00620.cpp \
    $(curdir)/AOTStubs-00621.cpp \
    $(curdir)/AOTStubs-00622.cpp \
    $(curdir)/AOTStubs-00623.cpp \
    $(curdir)/AOTStubs-00624.cpp \
    $(curdir)/AOTStubs-00625.cpp \
    $(curdir)/AOTStubs-00626.cpp \
    $(curdir)/AOTStubs-00627.cpp \
    $(curdir)/AOTStubs-00628.cpp \
    $(curdir)/AOTStubs-00629.cpp \
    $(curdir)/AOTStubs-00630.cpp \
    $(curdir)/AOTStubs-00631.cpp \
    $(curdir)/AOTStubs-00632.cpp \
    $(curdir)/AOTStubs-00633.cpp \
    $(curdir)/AOTStubs-00634.cpp \
    $(curdir)/AOTStubs-00635.cpp \
    $(curdir)/AOTStubs-00636.cpp \
    $(curdir)/AOTStubs-00637.cpp \
    $(curdir)/AOTStubs-00638.cpp \
    $(curdir)/AOTStubs-00639.cpp \
    $(curdir)/AOTStubs-00640.cpp \
    $(curdir)/AOTStubs-00641.cpp \
    $(curdir)/AOTStubs-00642.cpp \
    $(curdir)/AOTStubs-00643.cpp \
    $(curdir)/AOTStubs-00644.cpp \
    $(curdir)/AOTStubs-00645.cpp \
    $(curdir)/AOTStubs-00646.cpp \
    $(curdir)/AOTStubs-00647.cpp \
    $(curdir)/AOTStubs-00648.cpp \
    $(curdir)/AOTStubs-00649.cpp \
    $(curdir)/AOTStubs-00650.cpp \
    $(curdir)/AOTStubs-00651.cpp \
    $(curdir)/AOTStubs-00652.cpp \
    $(curdir)/AOTStubs-00653.cpp \
    $(curdir)/AOTStubs-00654.cpp \
    $(curdir)/AOTStubs-00655.cpp \
    $(curdir)/AOTStubs-00656.cpp \
    $(curdir)/AOTStubs-00657.cpp \
    $(curdir)/AOTStubs-00658.cpp \
    $(curdir)/AOTStubs-00659.cpp \
    $(curdir)/AOTStubs-00660.cpp \
    $(curdir)/AOTStubs-00661.cpp \
    $(curdir)/AOTStubs-00662.cpp \
    $(curdir)/AOTStubs-00663.cpp \
    $(curdir)/AOTStubs-00664.cpp \
    $(curdir)/AOTStubs-00665.cpp \
    $(curdir)/AOTStubs-00666.cpp \
    $(curdir)/AOTStubs-00667.cpp \
    $(curdir)/AOTStubs-00668.cpp \
    $(curdir)/AOTStubs-00669.cpp \
    $(curdir)/AOTStubs-00670.cpp \
    $(curdir)/AOTStubs-00671.cpp \
    $(curdir)/AOTStubs-00672.cpp \
    $(curdir)/AOTStubs-00673.cpp \
    $(curdir)/AOTStubs-00674.cpp \
    $(curdir)/AOTStubs-00675.cpp \
    $(curdir)/AOTStubs-00676.cpp \
    $(curdir)/AOTStubs-00677.cpp \
    $(curdir)/AOTStubs-00678.cpp \
    $(curdir)/AOTStubs-00679.cpp \
    $(curdir)/AOTStubs-00680.cpp \
    $(curdir)/AOTStubs-00681.cpp \
    $(curdir)/AOTStubs-00682.cpp \
    $(curdir)/AOTStubs-00683.cpp \
    $(curdir)/AOTStubs-00684.cpp \
    $(curdir)/AOTStubs-00685.cpp \
    $(curdir)/AOTStubs-00686.cpp \
    $(curdir)/AOTStubs-00687.cpp \
    $(curdir)/AOTStubs-00688.cpp \
    $(curdir)/AOTStubs-00689.cpp \
    $(curdir)/AOTStubs-00690.cpp \
    $(curdir)/AOTStubs-00691.cpp \
    $(curdir)/AOTStubs-00692.cpp \
    $(curdir)/AOTStubs-00693.cpp \
    $(curdir)/AOTStubs-00694.cpp \
    $(curdir)/AOTStubs-00695.cpp \
    $(curdir)/AOTStubs-00696.cpp \
    $(curdir)/AOTStubs-00697.cpp \
    $(curdir)/AOTStubs-00698.cpp \
    $(curdir)/AOTStubs-00699.cpp \
    $(curdir)/AOTStubs-00700.cpp \
    $(curdir)/AOTStubs-00701.cpp \
    $(curdir)/AOTStubs-00702.cpp \
    $(curdir)/AOTStubs-00703.cpp \
    $(curdir)/AOTStubs-00704.cpp \
    $(curdir)/AOTStubs-00705.cpp \
    $(curdir)/AOTStubs-00706.cpp \
    $(curdir)/AOTStubs-00707.cpp \
    $(curdir)/AOTStubs-00708.cpp \
    $(curdir)/AOTStubs-00709.cpp \
    $(curdir)/AOTStubs-00710.cpp \
    $(curdir)/AOTStubs-00711.cpp \
    $(curdir)/AOTStubs-00712.cpp \
    $(curdir)/AOTStubs-00713.cpp \
    $(curdir)/AOTStubs-00714.cpp \
    $(curdir)/AOTStubs-00715.cpp \
    $(curdir)/AOTStubs-00716.cpp \
    $(curdir)/AOTStubs-00717.cpp \
    $(curdir)/AOTStubs-00718.cpp \
    $(curdir)/AOTStubs-00719.cpp \
    $(curdir)/AOTStubs-00720.cpp \
    $(curdir)/AOTStubs-00721.cpp \
    $(curdir)/AOTStubs-00722.cpp \
    $(curdir)/AOTStubs-00723.cpp \
    $(curdir)/AOTStubs-00724.cpp \
    $(curdir)/AOTStubs-00725.cpp \
    $(curdir)/AOTStubs-00726.cpp \
    $(curdir)/AOTStubs-00727.cpp \
    $(curdir)/AOTStubs-00728.cpp \
    $(curdir)/AOTStubs-00729.cpp \
    $(curdir)/AOTStubs-00730.cpp \
    $(curdir)/AOTStubs-00731.cpp \
    $(curdir)/AOTStubs-00732.cpp \
    $(curdir)/AOTStubs-00733.cpp \
    $(curdir)/AOTStubs-00734.cpp \
    $(curdir)/AOTStubs-00735.cpp \
    $(curdir)/AOTStubs-00736.cpp \
    $(curdir)/AOTStubs-00737.cpp \
    $(curdir)/AOTStubs-00738.cpp \
    $(curdir)/AOTStubs-00739.cpp \
    $(curdir)/AOTStubs-00740.cpp \
    $(curdir)/AOTStubs-00741.cpp \
    $(curdir)/AOTStubs-00742.cpp \
    $(curdir)/AOTStubs-00743.cpp \
    $(curdir)/AOTStubs-00744.cpp \
    $(curdir)/AOTStubs-00745.cpp \
    $(curdir)/AOTStubs-00746.cpp \
    $(curdir)/AOTStubs-00747.cpp \
    $(curdir)/AOTStubs-00748.cpp \
    $(curdir)/AOTStubs-00749.cpp \
    $(curdir)/AOTStubs-00750.cpp \
    $(curdir)/AOTStubs-00751.cpp \
    $(curdir)/AOTStubs-00752.cpp \
    $(curdir)/AOTStubs-00753.cpp \
    $(curdir)/AOTStubs-00754.cpp \
    $(curdir)/AOTStubs-00755.cpp \
    $(curdir)/AOTStubs-00756.cpp \
    $(curdir)/AOTStubs-00757.cpp \
    $(curdir)/AOTStubs-00758.cpp \
    $(curdir)/AOTStubs-00759.cpp \
    $(curdir)/AOTStubs-00760.cpp \
    $(curdir)/AOTStubs-00761.cpp \
    $(curdir)/AOTStubs-00762.cpp \
    $(curdir)/AOTStubs-00763.cpp \
    $(curdir)/AOTStubs-00764.cpp \
    $(curdir)/AOTStubs-00765.cpp \
    $(curdir)/AOTStubs-00766.cpp \
    $(curdir)/AOTStubs-00767.cpp \
    $(curdir)/AOTStubs-00768.cpp \
    $(curdir)/AOTStubs-00769.cpp \
    $(curdir)/AOTStubs-00770.cpp \
    $(curdir)/AOTStubs-00771.cpp \
    $(curdir)/AOTStubs-00772.cpp \
    $(curdir)/AOTStubs-00773.cpp \
    $(curdir)/AOTStubs-00774.cpp \
    $(curdir)/AOTStubs-00775.cpp \
    $(curdir)/AOTStubs-00776.cpp \
    $(curdir)/AOTStubs-00777.cpp \
    $(curdir)/AOTStubs-00778.cpp \
    $(curdir)/AOTStubs-00779.cpp \
    $(curdir)/AOTStubs-00780.cpp \
    $(curdir)/AOTStubs-00781.cpp \
    $(curdir)/AOTStubs-00782.cpp \
    $(curdir)/AOTStubs-00783.cpp \
    $(curdir)/AOTStubs-00784.cpp \
    $(curdir)/AOTStubs-00785.cpp \
    $(curdir)/AOTStubs-00786.cpp \
    $(curdir)/AOTStubs-00787.cpp \
    $(curdir)/AOTStubs-00788.cpp \
    $(curdir)/AOTStubs-00789.cpp \
    $(curdir)/AOTStubs-00790.cpp \
    $(curdir)/AOTStubs-00791.cpp \
    $(curdir)/AOTStubs-00792.cpp \
    $(curdir)/AOTStubs-00793.cpp \
    $(curdir)/AOTStubs-00794.cpp \
    $(curdir)/AOTStubs-00795.cpp \
    $(curdir)/AOTStubs-00796.cpp \
    $(curdir)/AOTStubs-00797.cpp \
    $(curdir)/AOTStubs-00798.cpp \
    $(curdir)/AOTStubs-00799.cpp \
    $(curdir)/AOTStubs-00800.cpp \
    $(curdir)/AOTStubs-00801.cpp \
    $(curdir)/AOTStubs-00802.cpp \
    $(curdir)/AOTStubs-00803.cpp \
    $(curdir)/AOTStubs-00804.cpp \
    $(curdir)/AOTStubs-00805.cpp \
    $(curdir)/AOTStubs-00806.cpp \
    $(curdir)/AOTStubs-00807.cpp \
    $(curdir)/AOTStubs-00808.cpp \
    $(curdir)/AOTStubs-00809.cpp \
    $(curdir)/AOTStubs-00810.cpp \
    $(curdir)/AOTStubs-00811.cpp \
    $(curdir)/AOTStubs-00812.cpp \
    $(curdir)/AOTStubs-00813.cpp \
    $(curdir)/AOTStubs-00814.cpp \
    $(curdir)/AOTStubs-00815.cpp \
    $(curdir)/AOTStubs-00816.cpp \
    $(curdir)/AOTStubs-00817.cpp \
    $(curdir)/AOTStubs-00818.cpp \
    $(curdir)/AOTStubs-00819.cpp \
    $(curdir)/AOTStubs-00820.cpp \
    $(curdir)/AOTStubs-00821.cpp \
    $(curdir)/AOTStubs-00822.cpp \
    $(curdir)/AOTStubs-00823.cpp \
    $(curdir)/AOTStubs-00824.cpp \
    $(curdir)/AOTStubs-00825.cpp \
    $(curdir)/AOTStubs-00826.cpp \
    $(curdir)/AOTStubs-00827.cpp \
    $(curdir)/AOTStubs-00828.cpp \
    $(curdir)/AOTStubs-00829.cpp \
    $(curdir)/AOTStubs-00830.cpp \
    $(curdir)/AOTStubs-00831.cpp \
    $(curdir)/AOTStubs-00832.cpp \
    $(curdir)/AOTStubs-00833.cpp \
    $(curdir)/AOTStubs-00834.cpp \
    $(curdir)/AOTStubs-00835.cpp \
    $(curdir)/AOTStubs-00836.cpp \
    $(curdir)/AOTStubs-00837.cpp \
    $(curdir)/AOTStubs-00838.cpp \
    $(curdir)/AOTStubs-00839.cpp \
    $(curdir)/AOTStubs-00840.cpp \
    $(curdir)/AOTStubs-00841.cpp \
    $(curdir)/AOTStubs-00842.cpp \
    $(curdir)/AOTStubs-00843.cpp \
    $(curdir)/AOTStubs-00844.cpp \
    $(curdir)/AOTStubs-00845.cpp \
    $(curdir)/AOTStubs-00846.cpp \
    $(curdir)/AOTStubs-00847.cpp \
    $(curdir)/AOTStubs-00848.cpp \
    $(curdir)/AOTStubs-00849.cpp \
    $(curdir)/AOTStubs-00850.cpp \
    $(curdir)/AOTStubs-00851.cpp \
    $(curdir)/AOTStubs-00852.cpp \
    $(curdir)/AOTStubs-00853.cpp \
    $(curdir)/AOTStubs-00854.cpp \
    $(curdir)/AOTStubs-00855.cpp \
    $(curdir)/AOTStubs-00856.cpp \
    $(curdir)/AOTStubs-00857.cpp \
    $(curdir)/AOTStubs-00858.cpp \
    $(curdir)/AOTStubs-00859.cpp \
    $(curdir)/AOTStubs-00860.cpp \
    $(curdir)/AOTStubs-00861.cpp \
    $(curdir)/AOTStubs-00862.cpp \
    $(curdir)/AOTStubs-00863.cpp \
    $(curdir)/AOTStubs-00864.cpp \
    $(curdir)/AOTStubs-00865.cpp \
    $(curdir)/AOTStubs-00866.cpp \
    $(curdir)/AOTStubs-00867.cpp \
    $(curdir)/AOTStubs-00868.cpp \
    $(curdir)/AOTStubs-00869.cpp \
    $(curdir)/AOTStubs-00870.cpp \
    $(curdir)/AOTStubs-00871.cpp \
    $(curdir)/AOTStubs-00872.cpp \
    $(curdir)/AOTStubs-00873.cpp \
    $(curdir)/AOTStubs-00874.cpp \
    $(curdir)/AOTStubs-00875.cpp \
    $(curdir)/AOTStubs-00876.cpp \
    $(curdir)/AOTStubs-00877.cpp \
    $(curdir)/AOTStubs-00878.cpp \
    $(curdir)/AOTStubs-00879.cpp \
    $(curdir)/AOTStubs-00880.cpp \
    $(curdir)/AOTStubs-00881.cpp \
    $(curdir)/AOTStubs-00882.cpp \
    $(curdir)/AOTStubs-00883.cpp \
    $(curdir)/AOTStubs-00884.cpp \
    $(curdir)/AOTStubs-00885.cpp \
    $(curdir)/AOTStubs-00886.cpp \
    $(curdir)/AOTStubs-00887.cpp \
    $(curdir)/AOTStubs-00888.cpp \
    $(curdir)/AOTStubs-00889.cpp \
    $(curdir)/AOTStubs-00890.cpp \
    $(curdir)/AOTStubs-00891.cpp \
    $(curdir)/AOTStubs-00892.cpp \
    $(curdir)/AOTStubs-00893.cpp \
    $(curdir)/AOTStubs-00894.cpp \
    $(curdir)/AOTStubs-00895.cpp \
    $(curdir)/AOTStubs-00896.cpp \
    $(curdir)/AOTStubs-00897.cpp \
    $(curdir)/AOTStubs-00898.cpp \
    $(curdir)/AOTStubs-00899.cpp \
    $(curdir)/AOTStubs-00900.cpp \
    $(curdir)/AOTStubs-00901.cpp \
    $(curdir)/AOTStubs-00902.cpp \
    $(curdir)/AOTStubs-00903.cpp \
    $(curdir)/AOTStubs-00904.cpp \
    $(curdir)/AOTStubs-00905.cpp \
    $(curdir)/AOTStubs-00906.cpp \
    $(curdir)/AOTStubs-00907.cpp \
    $(curdir)/AOTStubs-00908.cpp \
    $(curdir)/AOTStubs-00909.cpp \
    $(curdir)/AOTStubs-00910.cpp \
    $(curdir)/AOTStubs-00911.cpp \
    $(curdir)/AOTStubs-00912.cpp \
    $(curdir)/AOTStubs-00913.cpp \
    $(curdir)/AOTStubs-00914.cpp \
    $(curdir)/AOTStubs-00915.cpp \
    $(curdir)/AOTStubs-00916.cpp \
    $(curdir)/AOTStubs-00917.cpp \
    $(curdir)/AOTStubs-00918.cpp \
    $(curdir)/AOTStubs-00919.cpp \
    $(curdir)/AOTStubs-00920.cpp \
    $(curdir)/AOTStubs-00921.cpp \
    $(curdir)/AOTStubs-00922.cpp \
    $(curdir)/AOTStubs-00923.cpp \
    $(curdir)/AOTStubs-00924.cpp \
    $(curdir)/AOTStubs-00925.cpp \
    $(curdir)/AOTStubs-00926.cpp \
    $(curdir)/AOTStubs-00927.cpp \
    $(curdir)/AOTStubs-00928.cpp \
    $(curdir)/AOTStubs-00929.cpp \
    $(curdir)/AOTStubs-00930.cpp \
    $(curdir)/AOTStubs-00931.cpp \
    $(curdir)/AOTStubs-00932.cpp \
    $(curdir)/AOTStubs-00933.cpp \
    $(curdir)/AOTStubs-00934.cpp \
    $(curdir)/AOTStubs-00935.cpp \
    $(curdir)/AOTStubs-00936.cpp \
    $(curdir)/AOTStubs-00937.cpp \
    $(curdir)/AOTStubs-00938.cpp \
    $(curdir)/AOTStubs-00939.cpp \
    $(curdir)/AOTStubs-00940.cpp \
    $(curdir)/AOTStubs-00941.cpp \
    $(curdir)/AOTStubs-00942.cpp \
    $(curdir)/AOTStubs-00943.cpp \
    $(curdir)/AOTStubs-00944.cpp \
    $(curdir)/AOTStubs-00945.cpp \
    $(curdir)/AOTStubs-00946.cpp \
    $(curdir)/AOTStubs-00947.cpp \
    $(curdir)/AOTStubs-00948.cpp \
    $(curdir)/AOTStubs-00949.cpp \
    $(curdir)/AOTStubs-00950.cpp \
    $(curdir)/AOTStubs-00951.cpp \
    $(curdir)/AOTStubs-00952.cpp \
    $(curdir)/AOTStubs-00953.cpp \
    $(curdir)/AOTStubs-00954.cpp \
    $(curdir)/AOTStubs-00955.cpp \
    $(curdir)/AOTStubs-00956.cpp \
    $(curdir)/AOTStubs-00957.cpp \
    $(curdir)/AOTStubs-00958.cpp \
    $(curdir)/AOTStubs-00959.cpp \
    $(curdir)/AOTStubs-00960.cpp \
    $(curdir)/AOTStubs-00961.cpp \
    $(curdir)/AOTStubs-00962.cpp \
    $(curdir)/AOTStubs-00963.cpp \
    $(curdir)/AOTStubs-00964.cpp \
    $(curdir)/AOTStubs-00965.cpp \
    $(curdir)/AOTStubs-00966.cpp \
    $(curdir)/AOTStubs-00967.cpp \
    $(curdir)/AOTStubs-00968.cpp \
    $(curdir)/AOTStubs-00969.cpp \
    $(curdir)/AOTStubs-00970.cpp \
    $(curdir)/AOTStubs-00971.cpp \
    $(curdir)/AOTStubs-00972.cpp \
    $(curdir)/AOTStubs-00973.cpp \
    $(curdir)/AOTStubs-00974.cpp \
    $(curdir)/AOTStubs-00975.cpp \
    $(curdir)/AOTStubs-00976.cpp \
    $(curdir)/AOTStubs-00977.cpp \
    $(curdir)/AOTStubs-00978.cpp \
    $(curdir)/AOTStubs-00979.cpp \
    $(curdir)/AOTStubs-00980.cpp \
    $(curdir)/AOTStubs-00981.cpp \
    $(curdir)/AOTStubs-00982.cpp \
    $(curdir)/AOTStubs-00983.cpp \
    $(curdir)/AOTStubs-00984.cpp \
    $(curdir)/AOTStubs-00985.cpp \
    $(curdir)/AOTStubs-00986.cpp \
    $(curdir)/AOTStubs-00987.cpp \
    $(curdir)/AOTStubs-00988.cpp \
    $(curdir)/AOTStubs-00989.cpp \
    $(curdir)/AOTStubs-00990.cpp \
    $(curdir)/AOTStubs-00991.cpp \
    $(curdir)/AOTStubs-00992.cpp \
    $(curdir)/AOTStubs-00993.cpp \
    $(curdir)/AOTStubs-00994.cpp \
    $(curdir)/AOTStubs-00995.cpp \
    $(curdir)/AOTStubs-00996.cpp \
    $(curdir)/AOTStubs-00997.cpp \
    $(curdir)/AOTStubs-00998.cpp \
    $(curdir)/AOTStubs-00999.cpp \
    $(NULL)

STATIC_LIBRARIES += aotstubs
aotstubs_BUILD_ALL = 1
aotstubs_CXXSRCS := $(stubcpps)
aotstubs_EXTRA_CXXFLAGS := -Wno-sign-compare

$(curdir)/dummy.cpp: $(topsrcdir)/aot/aotstubs.py $(topsrcdir)/aot/aotstubs.pickle
	@echo "Generating AOT stubs..."
	@mkdir -p aot
	@cd aot && python $(topsrcdir)/aot/AOTStubs.py --numstubheaders $(numstubs) --picklefile $(topsrcdir)/aot/aotstubs.pickle
	@touch $(curdir)/aot/dummy.cpp

$(stubcpps): $(curdir)/dummy.cpp