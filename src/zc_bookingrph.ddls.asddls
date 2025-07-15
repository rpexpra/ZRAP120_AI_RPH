@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'BookingId' ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_BOOKINGRPH
  as projection on ZR_BOOKINGRPH
{
  key Uuid,
  ParentUuid,
  BookingId,
  BookingDate,
  CustomerId,
  CarrierId,
  ConnectionId,
  FlightDate,
  FlightPrice,
  CurrencyCode,
  DiscountedFlightPrice,
  _Travel : redirected to parent ZC_TRAVELRPH
  
}
