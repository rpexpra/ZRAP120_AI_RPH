"!@testing ZR_BOOKINGRPH
CLASS ltc_zr_bookingrph DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA environment TYPE REF TO if_cds_test_environment.

    DATA td_zbookingrph TYPE STANDARD TABLE OF zbookingrph WITH EMPTY KEY.
    DATA act_results TYPE STANDARD TABLE OF zr_bookingrph WITH EMPTY KEY.
    DATA exp_results TYPE STANDARD TABLE OF zr_bookingrph WITH EMPTY KEY.

    "! In CLASS_SETUP, corresponding doubles and clone(s) for the CDS view under test and its dependencies are created.
    CLASS-METHODS class_setup RAISING cx_static_check.
    "! In CLASS_TEARDOWN, Generated database entities (doubles & clones) should be deleted at the end of test class execution.
    CLASS-METHODS class_teardown.

    "! SETUP method creates a common start state for each test method,
    "! clear_doubles clears the test data for all the doubles used in the test method before each test method execution.
    METHODS setup RAISING cx_static_check.

    "! In this method test data is inserted into the generated double(s) for test case
    "! "Calculate DISCOUNTEDFLIGHTPRICE field"
    METHODS td_calc_discountedflightprice.
    "! In this method test data is inserted into the generated double(s) for test case
    "! "When carrier_id = 'AF'"
    METHODS td_when_carrier_id_eq_af.
    "! In this method test data is inserted into the generated double(s) for test case
    "! "When carrier_id = 'LH'"
    METHODS td_carrier_id_eq_lh.

    "! <strong>Test Case:</strong> Calculate DISCOUNTEDFLIGHTPRICE field <br><br>
    "! Test calculation of DISCOUNTEDFLIGHTPRICE field.
    "! <br><br> The results should be asserted with the actuals.
    METHODS calc_discountedflightprice FOR TESTING RAISING cx_static_check.
    "! <strong>Test Case:</strong> When carrier_id = 'AF' <br><br>
    "! Test a CDS View when the CASE condition When carrier_id = 'AF' is satisfied.
    "! <br><br> The results should be asserted with the actuals.
    METHODS when_carrier_id_eq_af FOR TESTING RAISING cx_static_check.
    "! <strong>Test Case:</strong> When carrier_id = 'LH' <br><br>
    "! Test a CDS View when the CASE condition When carrier_id = 'LH' is satisfied.
    "! <br><br> The results should be asserted with the actuals.
    METHODS carrier_id_eq_lh FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_ZR_BOOKINGRPH IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZR_BOOKINGRPH' ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD calc_discountedflightprice.
    td_calc_discountedflightprice( ).
    SELECT * FROM zr_bookingrph INTO TABLE @act_results.

    cl_abap_unit_assert=>assert_equals( exp = lines( exp_results ) act = lines( act_results ) msg = 'Test Generated using AI: Recheck test data' ).
    LOOP AT exp_results INTO DATA(exp_result).
      cl_abap_unit_assert=>assert_equals( exp = exp_result-discountedflightprice act = act_results[ sy-tabix ]-discountedflightprice
      msg = 'Test Generated using AI: Expected result for field DISCOUNTEDFLIGHTPRICE is incorrect. Recheck test data.' ).
    ENDLOOP.
  ENDMETHOD.

  METHOD td_calc_discountedflightprice.
    " Prepare test data for 'zbookingrph'
    td_zbookingrph = VALUE #(
      (
        client = '100'
        uuid = '1234567890123456'
        parent_uuid = '6543210987654321'
        carrier_id = 'LH'
        flight_price = '1000'
      ) ).
    environment->insert_test_data( i_data = td_zbookingrph ).

    " Prepare test data for 'zr_bookingrph'
    exp_results = VALUE #(
      (
           uuid = '1234567890123456'
           parentuuid = '6543210987654321'
           carrierid = 'LH'
           flightprice = '1000'
           discountedflightprice = '900'
      ) ).
  ENDMETHOD.

  METHOD when_carrier_id_eq_af.
    td_when_carrier_id_eq_af( ).
    SELECT * FROM zr_bookingrph INTO TABLE @act_results.

    cl_abap_unit_assert=>assert_equals( exp = lines( exp_results ) act = lines( act_results ) msg = 'Test Generated using AI: Recheck test data' ).
    LOOP AT exp_results INTO DATA(exp_result).
      cl_abap_unit_assert=>assert_equals( exp = exp_result-DiscountedFlightPrice act = act_results[ sy-tabix ]-DiscountedFlightPrice
      msg = 'Test Generated using AI: Expected result for field DiscountedFlightPrice is incorrect. Recheck test data.' ).
    ENDLOOP.
  ENDMETHOD.

  METHOD td_when_carrier_id_eq_af.
    " Prepare test data for 'zbookingrph'
    td_zbookingrph = VALUE #(
      (
        client = '100'
        uuid = '1234567890123456'
        parent_uuid = '6543210987654321'
        carrier_id = 'AF'
        flight_price = '2000'
      ) ).
    environment->insert_test_data( i_data = td_zbookingrph ).

    " Prepare test data for 'zr_bookingrph'
    exp_results = VALUE #(
      (
           uuid = '1234567890123456'
           parentuuid = '6543210987654321'
           carrierid = 'AF'
           flightprice = '2000'
           discountedflightprice = '1700'
      ) ).
  ENDMETHOD.

  METHOD carrier_id_eq_lh.
    td_carrier_id_eq_lh( ).
    SELECT * FROM zr_bookingrph INTO TABLE @act_results.

    cl_abap_unit_assert=>assert_equals( exp = lines( exp_results ) act = lines( act_results ) msg = 'Test Generated using AI: Recheck test data' ).
    LOOP AT exp_results INTO DATA(exp_result).
      cl_abap_unit_assert=>assert_equals( exp = exp_result-DiscountedFlightPrice act = act_results[ sy-tabix ]-DiscountedFlightPrice
      msg = 'Test Generated using AI: Expected result for field DiscountedFlightPrice is incorrect. Recheck test data.' ).
    ENDLOOP.
  ENDMETHOD.

  METHOD td_carrier_id_eq_lh.
    " Prepare test data for 'zbookingrph'
    td_zbookingrph = VALUE #(
      (
        client = '100'
        uuid = '1234567890123456'
        parent_uuid = '6543210987654321'
        carrier_id = 'LH'
        flight_price = '1000'
      ) ).
    environment->insert_test_data( i_data = td_zbookingrph ).

    " Prepare test data for 'zr_bookingrph'
    exp_results = VALUE #(
      (
           uuid = '1234567890123456'
           parentuuid = '6543210987654321'
           carrierid = 'LH'
           flightprice = '1000'
           discountedflightprice = '900'
      ) ).
  ENDMETHOD.

ENDCLASS.
