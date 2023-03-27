CREATE TABLE `data_platform_planned_order_item_data`
(
		`PlannedOrder`                            int(16) NOT NULL,
	    `PlannedOrderItem`                        int(6) NOT NULL,
--		`PlannedOrderType`                        varchar(4) DEFAULT NULL,
		`Product`                                 varchar(40) DEFAULT NULL,
		`ProductDeliverFromParty`                 int(12) DEFAULT NULL,
		`ProductDeliverToParty`                   int(12) DEFAULT NULL,
		`IssuingPlant`                            varchar(4) DEFAULT NULL,
		`IssuingPlantStorageLocation`             varchar(4) DEFAULT NULL,
		`ReceivingPlant`                          varchar(4) DEFAULT NULL,
		`ReceivingPlantStorageLocation`           varchar(4) DEFAULT NULL,
		`ProductionPlantBusinessPartner`          int(12) DEFAULT NULL,
		`ProductionPlant`                         varchar(4) DEFAULT NULL,
        `ProductionPlantStorageLocation`          varchar(4) DEFAULT NULL,
        `BaseUnit`                                varchar(3) DEFAULT NULL,
        `MRPArea`                                 varchar(10) DEFAULT NULL,
		`MRPController`                           varchar(3) DEFAULT NULL,
--		`StockConfirmationPartnerFunction`        varchar(40) DEFAULT NULL,
--		`StockConfirmationBusinessPartner`        int(12) DEFAULT NULL,
--		`StockConfirmationPlant`                  varchar(4) DEFAULT NULL,
--		`StockConfirmationPlantBatch`             varchar(10) DEFAULT NULL,
--		`StorageLocationForMRP`                   varchar(4) DEFAULT NULL,
		`PlannedOrderQuantityInBaseUnit`          float(15) DEFAULT NULL,
		`PlannedOrderPlannedScrapQtyInBaseUnit`   float(15) DEFAULT NULL,
		`PlannedOrderIssuingUnit`                 varchar(3) DEFAULT NULL,
		`PlannedOrderReceivingUnit`               varchar(3) DEFAULT NULL,
		`PlannedOrderIssuingQuantity`             float(15) DEFAULT NULL,
		`PlannedOrderReceivingQuantity`           float(15) DEFAULT NULL,
        `PlannedOrderPlannedStartDate`            date DEFAULT NULL,
		`PlannedOrderPlannedStartTime`            time DEFAULT NULL,
		`PlannedOrderPlannedEndDate`              date DEFAULT NULL,
		`PlannedOrderPlannedEndTime`              time DEFAULT NULL,
		`LastChangeDateTime`                      datetime DEFAULT NULL,
		`OrderID`                                 int(16) DEFAULT NULL,
		`OrderItem`                               int(6) DEFAULT NULL,
		`ProductBuyer`                            int(12) DEFAULT NULL,
		`ProductSeller`                           int(12) DEFAULT NULL,
		`Project`                                 varchar(24) DEFAULT NULL,
		`Reservation`                             int(16) DEFAULT NULL,
		`ReservationItem`                         int(4) DEFAULT NULL,
		`PlannedOrderLongText`                    varchar(200) DEFAULT NULL,
		`PlannedOrderIsFixed`                     tinyint(1) DEFAULT NULL,
		`PlannedOrderBOMIsFixed`                  tinyint(1) DEFAULT NULL,
		`LastScheduledDate`                       date DEFAULT NULL,
		`ScheduledBasicEndDate`                   date DEFAULT NULL,
		`ScheduledBasicEndTime`                   time DEFAULT NULL,
		`ScheduledBasicStartDate`                 date DEFAULT NULL,
		`ScheduledBasicStartTime`                 time DEFAULT NULL,
		`SchedulingType`                          varchar(1) DEFAULT NULL,
		`PlannedOrderIsReleased`                  tinyint(1) DEFAULT NULL,
		`IsMarkedForDeletion`                     tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`PlannedOrder`, `PlannedOrderitem`),

    CONSTRAINT `DataPlatformPlannedOrderItemData_fk` FOREIGN KEY (`PlannedOrder`) REFERENCES `data_platform_planned_order_header_data` (`PlannedOrder`),
	
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProduct_fk` FOREIGN KEY (`Product`) REFERENCES `data_platform_product_master_general_data` (`Product`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataIssuingPlant_fk` FOREIGN KEY (`ProductDeliverFromParty`, `IssuingPlant`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataIssuingPlantStorageLocation_fk` FOREIGN KEY (`ProductDeliverFromParty`, `IssuingPlant`, `IssuingPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
	CONSTRAINT `DataPlatformPlannedOrderHeaderDataReceivingPlant_fk` FOREIGN KEY (`ProductDeliverToParty`, `ReceivingPlant`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataReceivingPlantStorageLocation_fk` FOREIGN KEY (`ProductDeliverToParty`, `ReceivingPlant`, `ReceivingPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductionPlant_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`, `ProductionPlant`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductionPlantStorageLocation_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`, `ProductionPlant`, `ProductionPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataBaseUnit_fk` FOREIGN KEY (`BaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataStockConfirmationPartnerFunction_fk` FOREIGN KEY (`StockConfirmationPartnerFunction`) REFERENCES `data_platform_partner_function_partner_function_data` (`PartnerFunction`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataStockConfirmationPlant_fk` FOREIGN KEY (`StockConfirmationBusinessPartner`, `StockConfirmationPlant`) REFERENCES `data_platform_plant_general_data` (`BusinessPartner`, `Plant`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataStockConfirmationPlantBatch_fk` FOREIGN KEY (`Product`, `StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `StockConfirmationPlantBatch`) REFERENCES `data_platform_batch_master_record_batch_data` (`Product`, `BusinessPartner`, `Plant`, `Batch`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataStorageLocationForMRP_fk` FOREIGN KEY (`StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `StorageLocationForMRP`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
	CONSTRAINT `DataPlatformPlannedOrderHeaderDataPlannedOrderIssuingUnit_fk` FOREIGN KEY (`PlannedOrderIssuingUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataPlannedOrderReceivingUnit_fk` FOREIGN KEY (`PlannedOrderReceivingUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataOrderItem_fk` FOREIGN KEY (`OrderID`, `OrderItem`) REFERENCES `data_platform_orders_item_data` (`OrderID`, `OrderItem`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductBuyer_fk` FOREIGN KEY (`ProductBuyer`) REFERENCES `data_platform_business_partner_general_data` (`Buyer`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductSeller_fk` FOREIGN KEY (`ProductSeller`) REFERENCES `data_platform_business_partner_general_data` (`Buyer`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProject_fk` FOREIGN KEY (`Project`) REFERENCES `data_platform_project_project_data` (`Project`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataReservationItem_fk` FOREIGN KEY (`Reservation`, `ReservationItem`) REFERENCES `data_platform_reservation_document_item_data` (`Reservation`, `ReservationItem`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;