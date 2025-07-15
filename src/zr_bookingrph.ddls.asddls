@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'BookingId' ]
define view entity ZR_BOOKINGRPH
  as select from zbookingrph as Booking
  association to parent ZR_TRAVELRPH as _Travel on $projection.ParentUuid = _Travel.Uuid
{
  key uuid as Uuid,
  parent_uuid as ParentUuid,
  booking_id as BookingId,
  booking_date as BookingDate,
  customer_id as CustomerId,
  carrier_id as CarrierId,
  connection_id as ConnectionId,
  flight_date as FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  flight_price as FlightPrice,
  currency_code as CurrencyCode,
  
//  discounted_flight_price as DiscountedFlightPrice,
 @Semantics.amount.currencyCode: 'CurrencyCode'
   case
      when carrier_id = 'LH' then cast(flight_price as abap.dec(16,2)) * cast('0.90' as abap.dec(5,2))
      when carrier_id = 'AF' then cast(flight_price as abap.dec(16,2)) * cast('0.85' as abap.dec(5,2))
      else cast(flight_price as abap.dec(16,2))
   end as DiscountedFlightPrice,
  _Travel
  
}
