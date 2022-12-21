"! <p class="shorttext synchronized" lang="en">calculate integer square root and measure runtime</p>
CLASS zcl_integer_square_roots DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    "! <p class="shorttext synchronized" lang="en">brute force method to find integer square root</p>
    METHODS brute_force_square_root
      IMPORTING
        number        TYPE int8
      RETURNING
        VALUE(result) TYPE int8
      RAISING
        cx_abap_invalid_value.

    "! <p class="shorttext synchronized" lang="en">finer algorithm to find integer square root</p>
    METHODS square_root_based_on_equation
      IMPORTING
        number        TYPE int8
      RETURNING
        VALUE(result) TYPE int8
      RAISING
        cx_abap_invalid_value.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_integer_square_roots IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA start_timestamp TYPE timestampl.
    DATA end_timestamp TYPE timestampl.

    FINAL(number) = CONV int8( 1099511627776 ).

    TRY.
        GET TIME STAMP FIELD start_timestamp.
        out->write( |Brute force algorithm result for { number } is: { brute_force_square_root( number ) }| ).
        GET TIME STAMP FIELD end_timestamp.
        out->write( |Runtime in seconds is: { cl_abap_tstmp=>subtract( tstmp1 = end_timestamp
                                                                       tstmp2 = start_timestamp ) }| ).

        GET TIME STAMP FIELD start_timestamp.
        out->write( |Advanced algorithm result for { number } is: { square_root_based_on_equation( number ) }| ).
        GET TIME STAMP FIELD end_timestamp.
        out->write( |Runtime in seconds is: { cl_abap_tstmp=>subtract( tstmp1 = end_timestamp
                                                                       tstmp2 = start_timestamp ) }| ).

        GET TIME STAMP FIELD start_timestamp.
        out->write( |ABAP statement result for { number } is: { sqrt( number ) }| ).
        GET TIME STAMP FIELD end_timestamp.
        out->write( |Runtime in seconds is: { cl_abap_tstmp=>subtract( tstmp1 = end_timestamp
                                                                       tstmp2 = start_timestamp ) }| ).

      CATCH cx_abap_invalid_value
            cx_parameter_invalid_range
            cx_parameter_invalid_type.
        out->write( |Error due to different reason.| ).
    ENDTRY.
  ENDMETHOD.

  METHOD brute_force_square_root.
    DATA counter TYPE int8 VALUE 0.
    DATA counter_squared TYPE int8 VALUE 0.

    DO.
      IF counter_squared >= number.
        result = counter.
        EXIT.
      ELSE.
        counter = counter + 1.
        counter_squared = counter * counter.
      ENDIF.
    ENDDO.

    IF counter_squared > number.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.
  ENDMETHOD.

  METHOD square_root_based_on_equation.
    DATA number_to_reduce TYPE int8 VALUE 0.
    DATA increasing_odd_number TYPE int8 VALUE 1.

    number_to_reduce = number.

    DO.
      result = result + 1.
      number_to_reduce = number_to_reduce - increasing_odd_number.
      increasing_odd_number = increasing_odd_number + 2.
      IF number_to_reduce <= 0.
        EXIT.
      ENDIF.
    ENDDO.

    IF ( result * result ) <> number.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
