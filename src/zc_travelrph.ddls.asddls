@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'TravelId' ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.sapObjectNodeType.name: 'ZTravelRPH'
define root view entity ZC_TRAVELRPH
  provider contract transactional_query
  as projection on ZR_TRAVELRPH
{
  key Uuid,
  TravelId,
  AgencyId,
  CustomerId,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  CurrencyCode,
  Description,
  Status,
  Destination,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  _Booking : redirected to composition child ZC_BOOKINGRPH
  
}
