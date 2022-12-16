CREATE TABLE `data_platform_delivery_document_header_data`
(
  `PlannedOrder`                            int(16) NOT NULL,
  `BOMItem`                                 int(8) NOT NULL,
  `BOMItemDescription`                      varchar(40) DEFAULT NULL,
  `BillOfMaterialCategory`                  varchar(1) DEFAULT NULL,
  `BillOfMaterialItemNumber`                int(4) DEFAULT NULL,
  `BillOfMaterialInternalID`                int(8) DEFAULT NULL,
  `Reservation`                             int(16) DEFAULT NULL,
  `ReservationItem`                         int(4) DEFAULT NULL,
  `ComponentProduct`                        varchar(40) DEFAULT NULL,
  `ComponentProductRequirementDate`         date DEFAULT NULL,
  `ComponentProductRequiredQuantity`        float(15) DEFAULT NULL,
  `BaseUnit`                                varchar(3) DEFAULT NULL,
  `WithdrawnQuantity`                       varchar(15) DEFAULT NULL,
  `ComponentScrapInPercent`                 varchar(7) DEFAULT NULL,
  `QuantityIsFixed`                         tinyint(1) DEFAULT NULL,
  `ComponentWithdrawnPlantBusinessPartner`  varchar(4) DEFAULT NULL,
  `ComponentWithdrawnPlant`                 varchar(4) DEFAULT NULL,
  `ComponentWithdrawnStorageLocation`       varchar(4) DEFAULT NULL,
  `MRPController`                           varchar(3) DEFAULT NULL,
  `LastChangeDateTime`                      datetime DEFAULT NULL,
  
   PRIMARY KEY (`PlannedOrder`, `BomItem`),
  
   CONSTRAINT `DataPlatformPlannedOrderComponentData_fk` FOREIGN KEY (`PlannedOrder`) REFERENCES `data_platform_planned_order_header_data` (`PlannedOrder`),
   CONSTRAINT `DataPlatformPlannedOrderComponentDataReservationItem_fk` FOREIGN KEY (`Reservation`, `ReservationItem`) REFERENCES `data_platform_reservation_document_item_data` (`Reservation`, `ReservationItem`),
   CONSTRAINT `DataPlatformPlannedOrderComponentDataComponentProduct_fk` FOREIGN KEY (`ComponentProduct`) REFERENCES `data_platform_product_master_general_data` (`Product`),
   CONSTRAINT `DataPlatformPlannedOrderComponentDataBaseUnit_fk` FOREIGN KEY (`BaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
   CONSTRAINT `DataPlatformPlannedOrderComponentDataComponentWithdrawnPlant_fk` FOREIGN KEY (`ComponentWithdrawnPlantBusinessPartner`, `ComponentWithdrawnPlant`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`),
   CONSTRAINT `DataPlatformPlannedOrderComponentDataComponentWithdrawnStorageLocation_fk` FOREIGN KEY (`ComponentWithdrawnPlantBusinessPartner`, `ComponentWithdrawnPlant`, `ComponentWithdrawnStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
