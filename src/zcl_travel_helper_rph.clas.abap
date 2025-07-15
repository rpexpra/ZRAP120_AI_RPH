CLASS zcl_travel_helper_rph DEFINITION
 PUBLIC
 FINAL
 CREATE PUBLIC .

 PUBLIC SECTION.
   METHODS: validate_customer IMPORTING iv_customer_id TYPE /dmo/customer_id RETURNING VALUE(rv_exists) TYPE abap_bool.
   METHODS: get_booking_status IMPORTING iv_status TYPE /dmo/booking_status_text RETURNING VALUE(rv_status) TYPE /dmo/booking_status.


 PROTECTED SECTION.
 PRIVATE SECTION.
ENDCLASS.


CLASS zcl_travel_helper_rph IMPLEMENTATION.

 METHOD validate_customer.
   rv_exists = abap_false.
   SELECT FROM /dmo/customer FIELDS customer_id
       WHERE customer_id = @iv_customer_id
   INTO TABLE @DATA(customers).

   IF customers IS NOT INITIAL.
     rv_exists = abap_true.
   ENDIF.
 ENDMETHOD.

 METHOD get_booking_status.
   CASE iv_status.
     WHEN 'Booked'.
       rv_status = 'B'.
     WHEN 'New'.
       rv_status = 'N'.
     WHEN 'Cancelled'.
       rv_status = 'X'.
   ENDCASE.
 ENDMETHOD.

ENDCLASS.
