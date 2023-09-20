class ZSC_CO_EPM_PRODUCT_SOAP6 definition
  public
  inheriting from CL_PROXY_CLIENT
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !DESTINATION type ref to IF_PROXY_DESTINATION optional
      !LOGICAL_PORT_NAME type PRX_LOGICAL_PORT_NAME optional
    preferred parameter LOGICAL_PORT_NAME
    raising
      CX_AI_SYSTEM_FAULT .
  methods GET_PRICE
    importing
      !INPUT type ZSC_REQ_MSG_TYPE6
    exporting
      !OUTPUT type ZSC_RES_MSG_TYPE6
    raising
      CX_AI_SYSTEM_FAULT
      ZSC_CX_FAULT_MSG_TYPE6 .
protected section.
private section.
ENDCLASS.



CLASS ZSC_CO_EPM_PRODUCT_SOAP6 IMPLEMENTATION.


  method CONSTRUCTOR.

  super->constructor(
    class_name          = 'ZSC_CO_EPM_PRODUCT_SOAP6'
    logical_port_name   = logical_port_name
    destination         = destination
  ).

  endmethod.


  method GET_PRICE.

  data(lt_parmbind) = value abap_parmbind_tab(
    ( name = 'INPUT' kind = '0' value = ref #( INPUT ) )
    ( name = 'OUTPUT' kind = '1' value = ref #( OUTPUT ) )
  ).
  if_proxy_client~execute(
    exporting
      method_name = 'GET_PRICE'
    changing
      parmbind_tab = lt_parmbind
  ).

  endmethod.
ENDCLASS.
