add_custom_target(test_e4x)

as3_set_arguments(XML/e13_4_4_3.as USES_SWF_VERSIONS)
as3_set_arguments(XML/e13_4_4_29.as USES_SWF_VERSIONS)
as3_set_arguments(XML/e13_4_4_32.as USES_SWF_VERSIONS)

as3_find_tests(test_e4x *)