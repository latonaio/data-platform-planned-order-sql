CREATE TABLE `data_platform_planned_order_header_data`
(
		`PlannedOrder`                          	  		int(16) NOT NULL,
		`SupplyChainRelationshipID`                   		int(16) NOT NULL,
		`SupplyChainRelationshipDeliveryID`         		int(6) NOT NULL,
		`SupplyChainRelationshipDeliveryPlantID`    		int(4) NOT NULL,
		`SupplyChainRelationshipProductionPlantID`    		int(4) DEFAULT NULL,
		`PlannedOrderType`                       	  		varchar(4) NOT NULL,
		`Product`                                 	  		varchar(40) NOT NULL,
		`Buyer`   		                         	  		int(12) NOT NULL,
		`Seller`        		                   	  		int(12) NOT NULL,
		`DestinationDeliverToParty`           		  		int(12) NOT NULL,
		`DestinationDeliverToPlant`               	  		varchar(4) NOT NULL,
		`DestinationDeliverToPlantStorageLocation` 	  		varchar(4) DEFAULT NULL,
		`DepartureDeliverFromParty`   		       	  		int(12) NOT NULL,
		`DepartureDeliverFromPlant`                	  		varchar(4) NOT NULL,
		`DepartureDeliverFromPlantStorageLocation` 	  		varchar(4) DEFAULT NULL,
		`OwnerProductionPlantBusinessPartner`     	  		int(12) DEFAULT NULL,
		`OwnerProductionPlant`                    	  		varchar(4) DEFAULT NULL,
        `OwnerProductionPlantStorageLocation`     	  		varchar(4) DEFAULT NULL,
		`ProductBaseUnit`							  		varchar(3) NOT NULL,
        `MRPArea`                                 	  		varchar(10) DEFAULT NULL,
		`MRPController`                           	  		varchar(3) DEFAULT NULL,
        `ProductionVersion`                       	  		int(16) DEFAULT NULL,
        `BillOfMaterial`                          	  		int(16) DEFAULT NULL,
        `Operations`                              	  		int(16) DEFAULT NULL,
		`PlannedOrderQuantityInBaseUnit`          	  		float(15) NOT NULL,
		`PlannedOrderQuantityInDestinationDeliveryUnit` 	float(15) NOT NULL,
		`PlannedOrderQuantityInDepartureDeliveryUnit` 		float(15) NOT NULL,
		`PlannedOrderQuantityInDestinationProductionUnit`	float(15) DEFAULT NULL,
		`PlannedOrderQuantityInDepartureProductionUnit`		float(15) DEFAULT NULL,
		`PlannedOrderDestinationDeliveryUnit`    	  		varchar(3) NOT NULL,
		`PlannedOrderDepartureDeliveryUnit`		      		varchar(3) NOT NULL,
		`PlannedOrderDestinationProductionUnit`    	  		varchar(3) DEFAULT NULL,
		`PlannedOrderDepartureProductionUnit`	      		varchar(3) DEFAULT NULL,
		`PlannedOrderPlannedScrapQtyInBaseUnit`   	  		float(15) DEFAULT NULL,
        `PlannedOrderPlannedStartDate`            	  		date NOT NULL,
		`PlannedOrderPlannedStartTime`            	  		time NOT NULL,
		`PlannedOrderPlannedEndDate`              	  		date NOT NULL,
		`PlannedOrderPlannedEndTime`              	  		time NOT NULL,
		`OrderID`                                 	  		int(16) DEFAULT NULL,
		`OrderItem`                               	  		int(6) DEFAULT NULL,
		`Project`                                 	  		int(16) DEFAULT NULL,
		`WBSElement`                               	  		int(8) DEFAULT NULL,
		`Reservation`                             	  		int(16) DEFAULT NULL,
		`ReservationItem`                         	  		int(4) DEFAULT NULL,
		`PlannedOrderLongText`                    	  		varchar(1000) DEFAULT NULL,
		`LastScheduledDate`                       	  		date DEFAULT NULL,
		`ScheduledBasicEndDate`                   	  		date DEFAULT NULL,
		`ScheduledBasicEndTime`                   	  		time DEFAULT NULL,
		`ScheduledBasicStartDate`                 	  		date DEFAULT NULL,
		`ScheduledBasicStartTime`                 	  		time DEFAULT NULL,
		`SchedulingType`                          	  		varchar(1) DEFAULT NULL,
		`PlannedOrderIsReleased`                  	  		tinyint(1) DEFAULT NULL,
		`CreationDate`	                          	  		date NOT NULL,
		`CreationTime`                            	  		time NOT NULL,
		`LastChangeDate`	                      	  		date NOT NULL,
		`LastChangeTime`                          	  		time NOT NULL,
		`IsMarkedForDeletion`                     	  		tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`PlannedOrder`),

    CONSTRAINT `DPFMPlannedOrderHeaderDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMPlannedOrderHeaderDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DestinationDeliverToParty`, `DepartureDeliverFromParty`) REFERENCES `data_platform_scr_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    -- CONSTRAINT `DPFMPlannedOrderHeaderDataSCRDeliveryPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DestinationDeliverToParty`, `DepartureDeliverFromParty`, `DestinationDeliverToPlant`, `DepartureDeliverFromPlant`, `Product`) REFERENCES `data_platform_scr_delivery_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`),  テーブルなし
	-- CONSTRAINT `DPFMPlannedOrderHeaderDataSCRProductionPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `OwnerProductionPlantBusinessPartner`, `OwnerProductionPlant`, `Product`) REFERENCES `data_platform_scr_production_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`),　　テーブルなし
    -- CONSTRAINT `DPFMPlannedOrderHeaderDataDestinationDeliverToPlantStorageLocation_fk` FOREIGN KEY (`DestinationDeliverToParty`, `DestinationDeliverToPlant`, `DestinationDeliverToPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),  too long
	-- CONSTRAINT `DPFMPlannedOrderHeaderDataDepartureDeliverFromPlantStorageLocation_fk` FOREIGN KEY (`DepartureDeliverFromParty`, `DepartureDeliverFromPlant`, `DepartureDeliverFromPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),  too long
    CONSTRAINT `DPFMPlannedOrderHeaderDataOwnerProductionPlantStorageLocation_fk` FOREIGN KEY (`OwnerProductionPlantBusinessPartner`, `OwnerProductionPlant`, `OwnerProductionPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DPFMPlannedOrderHeaderDataProductBaseUnit_fk` FOREIGN KEY (`ProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
	CONSTRAINT `DPFMPlannedOrderHeaderDataProductionVersion_fk` FOREIGN KEY (`ProductionVersion`) REFERENCES `data_platform_production_version_header_data` (`ProductionVersion`),
    CONSTRAINT `DPFMPlannedOrderHeaderDataBillOfMaterial_fk` FOREIGN KEY (`BillOfMaterial`) REFERENCES `data_platform_bill_of_material_header_data` (`BillOfMaterial`),
    CONSTRAINT `DPFMPlannedOrderHeaderDataOperations_fk` FOREIGN KEY (`Operations`) REFERENCES `data_platform_operations_header_data` (`Operations`),
    CONSTRAINT `DPFMPlannedOrderHeaderDataPlannedOrderDestinationDeliveryUnit_fk` FOREIGN KEY (`PlannedOrderDestinationDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
	CONSTRAINT `DPFMPlannedOrderHeaderDataPlannedOrderDepartureDeliveryUnit_fk` FOREIGN KEY (`PlannedOrderDepartureDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    -- CONSTRAINT `DPFMPlannedOrderHeaderDataPlannedOrderDestinationProductionUnit_fk` FOREIGN KEY (`PlannedOrderDestinationProductionUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),  too long
	CONSTRAINT `DPFMPlannedOrderHeaderDataPlannedOrderDepartureProductionUnit_fk` FOREIGN KEY (`PlannedOrderDepartureProductionUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
	CONSTRAINT `DPFMPlannedOrderHeaderDataOrderItem_fk` FOREIGN KEY (`OrderID`, `OrderItem`) REFERENCES `data_platform_orders_item_data` (`OrderID`, `OrderItem`),
    -- CONSTRAINT `DPFMPlannedOrderHeaderDataProject_fk` FOREIGN KEY (`Project`) REFERENCES `data_platform_project_project_data` (`Project`),　　テーブルなし
    -- CONSTRAINT `DPFMPlannedOrderHeaderDataWBSElement_fk` FOREIGN KEY (`Project`, `WBSElement`) REFERENCES `data_platform_project_wbs_element_data` (`Project`, `WBSElement`),　　テーブルなし
	-- CONSTRAINT `DPFMPlannedOrderHeaderDataReservationItem_fk` FOREIGN KEY (`Reservation`, `ReservationItem`) REFERENCES `data_platform_reservation_document_item_data` (`Reservation`, `ReservationItem`)　テーブルなし

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
