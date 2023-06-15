CREATE TABLE `data_platform_planned_order_header_data`
(
		`PlannedOrder`                          	  	int(16) NOT NULL,
		`SupplyChainRelationshipID`                   	int(16) NOT NULL,
		`SupplyChainRelationshipDeliveryID`         	int(6) NOT NULL,
		`SupplyChainRelationshipDeliveryPlantID`    	int(4) NOT NULL,
		`SupplyChainRelationshipProductionPlantID`    	int(4) DEFAULT NULL,
		`PlannedOrderType`                       	  	varchar(4) NOT NULL,
		`Product`                                 	  	varchar(40) NOT NULL,
		`Buyer`   		                         	  	int(12) NOT NULL,
		`Seller`        		                   	  	int(12) NOT NULL,
		`DepartureDeliverFromParty`   		       	  	int(12) NOT NULL,
		`DepartureDeliverFromPlant`                	  	varchar(4) NOT NULL,
		`DepartureDeliverFromPlantStorageLocation` 	  	varchar(4) DEFAULT NULL,
		`DestinationDeliverToParty`           		  	int(12) NOT NULL,
		`DestinationDeliverToPlant`               	  	varchar(4) NOT NULL,
		`DestinationDeliverToPlantStorageLocation` 	  	varchar(4) DEFAULT NULL,
		`OwnerProductionPlantBusinessPartner`     	  	int(12) DEFAULT NULL,
		`OwnerProductionPlant`                    	  	varchar(4) DEFAULT NULL,
        `OwnerProductionPlantStorageLocation`     	  	varchar(4) DEFAULT NULL,
		`ProductBaseUnit`							  	varchar(3) NOT NULL,
		`ProductDeliveryUnit`						  	varchar(3) NOT NULL,
		`ProductProductionUnit`						  	varchar(3) DEFAULT NULL,
        `MRPArea`                                 	  	varchar(10) DEFAULT NULL,
		`MRPController`                           	  	varchar(3) DEFAULT NULL,
        `ProductionVersion`                       	  	int(16) DEFAULT NULL,
        `BillOfMaterial`                          	  	int(16) DEFAULT NULL,
        `Operations`                              	  	int(16) DEFAULT NULL,
		`PlannedOrderQuantityInBaseUnit`          	  	float(15) NOT NULL,
		`PlannedOrderQuantityInDepartureDeliveryUnit` 	float(15) NOT NULL,
		`PlannedOrderQuantityInDestinationDeliveryUnit` float(15) NOT NULL,
		`PlannedOrderDepartureDeliveryUnit`		      	varchar(3) NOT NULL,
		`PlannedOrderDestinationDelvieryUnit`    	  	varchar(3) NOT NULL,
		`PlannedOrderQuantityInProductionUnit`     	  	float(15) DEFAULT NULL,
		`PlannedOrderPlannedScrapQtyInBaseUnit`   	  	float(15) DEFAULT NULL,
        `PlannedOrderPlannedStartDate`            	  	date DEFAULT NULL,
		`PlannedOrderPlannedStartTime`            	  	time DEFAULT NULL,
		`PlannedOrderPlannedEndDate`              	  	date DEFAULT NULL,
		`PlannedOrderPlannedEndTime`              	  	time DEFAULT NULL,
		`OrderID`                                 	  	int(16) DEFAULT NULL,
		`OrderItem`                               	  	int(6) DEFAULT NULL,
		`Project`                                 	  	int(16) DEFAULT NULL,
		`WBSElement`                               	  	int(8) DEFAULT NULL,
		`Reservation`                             	  	int(16) DEFAULT NULL,
		`ReservationItem`                         	  	int(4) DEFAULT NULL,
		`PlannedOrderLongText`                    	  	varchar(1000) DEFAULT NULL,
		`LastScheduledDate`                       	  	date DEFAULT NULL,
		`ScheduledBasicEndDate`                   	  	date DEFAULT NULL,
		`ScheduledBasicEndTime`                   	  	time DEFAULT NULL,
		`ScheduledBasicStartDate`                 	  	date DEFAULT NULL,
		`ScheduledBasicStartTime`                 	  	time DEFAULT NULL,
		`SchedulingType`                          	  	varchar(1) DEFAULT NULL,
		`PlannedOrderIsReleased`                  	  	tinyint(1) DEFAULT NULL,
		`CreationDate`	                          	  	date DEFAULT NULL,
		`CreationTime`                            	  	time DEFAULT NULL,
		`LastChangeDate`	                      	  	date DEFAULT NULL,
		`LastChangeTime`                          	  	time DEFAULT NULL,
		`IsMarkedForDeletion`                     	  	tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`PlannedOrder`),

    CONSTRAINT `DataPlatformPlannedOrderHeaderDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_supply_chain_relationship_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DestinationDeliverToParty`, `DepartureDeliverFromParty`) REFERENCES `data_platform_supply_chain_relationship_delivery_relation_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`, , `DeliverToParty`, `DeliverFromParty`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataSCRDeliveryPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DestinationDeliverToParty`, `DepartureDeliverFromParty`, `DestinationDeliverToPlant`, `DepartureDeliverFromPlant`, `Product`) REFERENCES `data_platform_supply_chain_relationship_delivery_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`),
	CONSTRAINT `DataPlatformPlannedOrderHeaderDataSCRProductionPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `OwnerProductionPlantBusinessPartner`, `OwnerProductionPlant`, `Product`) REFERENCES `data_platform_supply_chain_relationship_production_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataDepartureDeliverFromPlantStorageLocation_fk` FOREIGN KEY (`DepartureDeliverFromParty`, `DepartureDeliverFromPlant`, `DepartureDeliverFromPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataDestinationDeliverToPlantStorageLocation_fk` FOREIGN KEY (`DestinationDeliverToParty`, `DestinationDeliverToPlant`, `DestinationDeliverToPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataOwnerProductionPlantStorageLocation_fk` FOREIGN KEY (`OwnerProductionPlantBusinessPartner`, `OwnerProductionPlant`, `OwnerProductionPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductBaseUnit_fk` FOREIGN KEY (`ProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductDeliveryUnit_fk` FOREIGN KEY (`ProductDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductProductionUnit_fk` FOREIGN KEY (`ProductProductionUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
	CONSTRAINT `DataPlatformPlannedOrderHeaderDataProductionVersion_fk` FOREIGN KEY (`ProductionVersion`) REFERENCES `data_platform_production_version_header_data` (`ProductionVersion`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataBillOfMaterial_fk` FOREIGN KEY (`BillOfMaterial`) REFERENCES `data_platform_bill_of_material_header_data` (`BillOfMaterial`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataOperations_fk` FOREIGN KEY (`Operations`) REFERENCES `data_platform_operations_header_data` (`Operations`),
	CONSTRAINT `DataPlatformPlannedOrderHeaderDataBaseUnit_fk` FOREIGN KEY (`BaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataOrderItem_fk` FOREIGN KEY (`OrderID`, `OrderItem`) REFERENCES `data_platform_orders_item_data` (`OrderID`, `OrderItem`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataProject_fk` FOREIGN KEY (`Project`) REFERENCES `data_platform_project_project_data` (`Project`),
    CONSTRAINT `DataPlatformPlannedOrderHeaderDataWBSElement_fk` FOREIGN KEY (`Project`, `WBSElement`) REFERENCES `data_platform_project_wbs_element_data` (`Project`, `WBSElement`),
	CONSTRAINT `DataPlatformPlannedOrderHeaderDataReservationItem_fk` FOREIGN KEY (`Reservation`, `ReservationItem`) REFERENCES `data_platform_reservation_document_item_data` (`Reservation`, `ReservationItem`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
