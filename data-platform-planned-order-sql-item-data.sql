CREATE TABLE `data_platform_planned_order_item_data`
(
		`PlannedOrder`                            	int(16) NOT NULL,
	  `PlannedOrderItem`                        	int(6) NOT NULL,
    `PrecedingPlannedOrderItem`                 int(6) DEFAULT NULL,
    `FollowingPlannedOrderItem`                 int(6) DEFAULT NULL,
		`SupplyChainRelationshipID`               	int(16) NOT NULL,
		`SupplyChainRelationshipDeliveryID`         int(6) NOT NULL,
		`SupplyChainRelationshipDeliveryPlantID`    int(4) NOT NULL,
		`SupplyChainRelationshipProductionPlantID`  int(4) DEFAULT NULL,
    `SupplyChainRelationshipStockConfPlantID`   int(4) NOT NULL,
		`PlannedOrderType`                         	varchar(4) NOT NULL,
		`Product`                                 	varchar(40) NOT NULL,
		`Buyer`		                            	    int(12) NOT NULL,
		`Seller`    		                       	    int(12) NOT NULL,
		`DeliverToParty` 		                  	    int(12) NOT NULL,
		`DeliverToPlant` 		              	  	    varchar(4) NOT NULL,
		`DeliverToPlantStorageLocation` 	      	  varchar(4) DEFAULT NULL,
		`DeliverFromParty`   		              	    int(12) NOT NULL,
		`DeliverFromPlant`                	  	  	varchar(4) NOT NULL,
		`DeliverFromPlantStorageLocation` 		    	varchar(4) DEFAULT NULL,
		`ProductionPlantBusinessPartner`          	int(12) DEFAULT NULL,
		`ProductionPlant`                         	varchar(4) DEFAULT NULL,
    `ProductionPlantStorageLocation`          	varchar(4) DEFAULT NULL,
    `ProductBaseUnit`                          	varchar(3) NOT NULL,
    `ProductDeliveryUnit`                      	varchar(3) NOT NULL,
		`ProductProductionUnit`					          	varchar(3) DEFAULT NULL,
    `MRPArea`                                 	varchar(10) DEFAULT NULL,
	 	`MRPController`                           	varchar(3) DEFAULT NULL,
    `ProductionVersion`                       	int(16) DEFAULT NULL,
    `ProductionVersionItem`                   	int(6) DEFAULT NULL,
  	`StockConfirmationBusinessPartner`        	int(12) NOT NULL,
  	`StockConfirmationPlant`                  	varchar(4) NOT NULL,
  	`StockConfirmationPlantStorageLocation`   	varchar(4) DEFAULT NULL,
    `BillOfMaterial`                          	int(16) DEFAULT NULL,
    `Operations`                              	int(16) DEFAULT NULL,
		`PlannedOrderQuantityInBaseUnit`          	float(15) NOT NULL,
		`PlannedOrderQuantityInDeliveryUnit`       	float(15) NOT NULL,
		`PlannedOrderQuantityInProductionUnit`     	float(15) DEFAULT NULL,
		`PlannedOrderPlannedScrapQtyInBaseUnit`   	float(15) DEFAULT NULL,
    `PlannedOrderMinimumLotSizeQuantity` 	   float(15) NOT NULL,
    `PlannedOrderStandardLotSizeQuantity`    	float(15) NOT NULL,
    `PlannedOrderMaximumLotSizeQuantity`    	float(15) NOT NULL,
    `PlannedOrderLotSizeRoundingQuantity`    	float(15) DEFAULT NULL,
    `PlannedOrderLotSizeIsFixed`             	tinyint(1) DEFAULT NULL,
    `PlannedOrderPlannedStartDate`            	date NOT NULL,
		`PlannedOrderPlannedStartTime`            	time NOT NULL,
		`PlannedOrderPlannedEndDate`              	date NOT NULL,
		`PlannedOrderPlannedEndTime`              	time NOT NULL,
		`OrderID`                                 	int(16) DEFAULT NULL,
		`OrderItem`                               	int(6) DEFAULT NULL,
		`Project`                                 	int(16) DEFAULT NULL,
		`WBSElement`                               	int(8) DEFAULT NULL,
		`Reservation`                             	int(16) DEFAULT NULL,
		`ReservationItem`                         	int(4) DEFAULT NULL,
		`PlannedOrderLongText`                    	varchar(200) DEFAULT NULL,
		`LastScheduledDate`                       	date DEFAULT NULL,
		`ScheduledBasicEndDate`                   	date DEFAULT NULL,
		`ScheduledBasicEndTime`                   	time DEFAULT NULL,
		`ScheduledBasicStartDate`                 	date DEFAULT NULL,
		`ScheduledBasicStartTime`                 	time DEFAULT NULL,
		`SchedulingType`                          	varchar(1) DEFAULT NULL,
		`PlannedOrderIsReleased`                  	tinyint(1) DEFAULT NULL,
		`CreationDate`	                          	date NOT NULL,
		`CreationTime`                            	time NOT NULL,
		`LastChangeDate`	                      	date NOT NULL,
		`LastChangeTime`                         	time NOT NULL,
		`IsMarkedForDeletion`                     	tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`PlannedOrder`, `PlannedOrderItem`),

    CONSTRAINT `DPFMPlannedOrderItemData_fk` FOREIGN KEY (`PlannedOrder`) REFERENCES `data_platform_planned_order_header_data` (`PlannedOrder`),
    CONSTRAINT `DPFMPlannedOrderItemDataPrecedingPlannedOrderItem_fk` FOREIGN KEY (`PlannedOrder`, `PrecedingPlannedOrderItem`) REFERENCES `data_platform_planned_order_item_data` (`PlannedOrder`, `PlannedOrderItem`),
    CONSTRAINT `DPFMPlannedOrderItemDataFollowingPlannedOrderItem_fk` FOREIGN KEY (`PlannedOrder`, `FollowingPlannedOrderItem`) REFERENCES `data_platform_planned_order_item_data` (`PlannedOrder`, `PlannedOrderItem`),
    CONSTRAINT `DPFMPlannedOrderItemDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMPlannedOrderItemDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`) REFERENCES `data_platform_scr_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    -- CONSTRAINT `DPFMPlannedOrderItemDataSCRDeliveryPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`) REFERENCES `data_platform_scr_delivery_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`),  テーブルなし
	-- CONSTRAINT `DPFMPlannedOrderItemDataSCRProductionPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`) REFERENCES `data_platform_scr_production_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`),　　テーブルなし
	-- CONSTRAINT `DPFMPlannedOrderItemDataSCRStockConfPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipStockConfPlantID`, `Buyer`, `Seller`, `StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `Product`) REFERENCES `data_platform_scr_stock_conf_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipStockConfPlantID`, `Buyer`, `Seller`, `StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `Product`),　　テーブルなし
	CONSTRAINT `DPFMPlannedOrderItemDataDeliverFromPlantStorageLocation_fk` FOREIGN KEY (`DeliverFromParty`, `DeliverFromPlant`, `DeliverFromPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DPFMPlannedOrderItemDataDeliverToPlantStorageLocation_fk` FOREIGN KEY (`DeliverToParty`, `DeliverToPlant`, `DeliverToPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DPFMPlannedOrderItemDataProductionPlantStorageLocation_fk` FOREIGN KEY (`ProductionPlantBusinessPartner`, `ProductionPlant`, `ProductionPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
    CONSTRAINT `DPFMPlannedOrderItemDataProductionVersionItem_fk` FOREIGN KEY (`ProductionVersion`, `ProductionVersionItem`) REFERENCES `data_platform_production_version_item_data` (`ProductionVersion`, `ProductionVersionItem`),
	CONSTRAINT `DPFMPlannedOrderItemDataStockConfirmationPlantStorageLocation_fk` FOREIGN KEY (`StockConfirmationBusinessPartner`, `StockConfirmationPlant`, `StockConfirmationPlantStorageLocation`) REFERENCES `data_platform_plant_storage_location_data` (`BusinessPartner`, `Plant`, `StorageLocation`),
	CONSTRAINT `DPFMPlannedOrderItemDataBillOfMaterial_fk` FOREIGN KEY (`BillOfMaterial`) REFERENCES `data_platform_bill_of_material_header_data` (`BillOfMaterial`),
    CONSTRAINT `DPFMPlannedOrderItemDataOperations_fk` FOREIGN KEY (`Operations`) REFERENCES `data_platform_operations_header_data` (`Operations`),
	CONSTRAINT `DPFMPlannedOrderItemDataProductBaseUnit_fk` FOREIGN KEY (`ProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemDataProductDeliveryUnit_fk` FOREIGN KEY (`ProductDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemDataProductProductionUnit_fk` FOREIGN KEY (`ProductProductionUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
	CONSTRAINT `DPFMPlannedOrderItemDataOrderItem_fk` FOREIGN KEY (`OrderID`, `OrderItem`) REFERENCES `data_platform_orders_item_data` (`OrderID`, `OrderItem`),
    -- CONSTRAINT `DPFMPlannedOrderItemDataProject_fk` FOREIGN KEY (`Project`) REFERENCES `data_platform_project_project_data` (`Project`),  テーブルなし
    -- CONSTRAINT `DPFMPlannedOrderItemDataWBSElement_fk` FOREIGN KEY (`Project`, `WBSElement`) REFERENCES `data_platform_project_wbs_element_data` (`Project`, `WBSElement`),　　テーブルなし
	-- CONSTRAINT `DPFMPlannedOrderItemDataReservationItem_fk` FOREIGN KEY (`Reservation`, `ReservationItem`) REFERENCES `data_platform_reservation_document_item_data` (`Reservation`, `ReservationItem`)　　テーブルなし

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
