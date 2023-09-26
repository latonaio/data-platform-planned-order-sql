CREATE TABLE `data_platform_planned_order_item_operation_data`
(
    `PlannedOrder`                             int(16) NOT NULL,
    `PlannedOrderItem`                         int(6) NOT NULL,
    `Operations`                               int(16) NOT NULL,
    `OperationsItem`                           int(6) NOT NULL,
    `OperationID`                              int(4) NOT NULL,
    `OperationType`                            varchar(4) NOT NULL,
	`SupplyChainRelationshipID`                int(16) NOT NULL,
	`SupplyChainRelationshipDeliveryID`        int(6) NOT NULL,
	`SupplyChainRelationshipDeliveryPlantID`   int(4) NOT NULL,
	`SupplyChainRelationshipProductionPlantID` int(4) NOT NULL,
    `Product`                                  varchar(40) NOT NULL, 
    `Buyer`                                    int(12) NOT NULL,
    `Seller`                                   int(12) NOT NULL,
    `DeliverToParty`                           int(12) NOT NULL,
    `DeliverToPlant`                           varchar(4) NOT NULL,
    `DeliverFromParty`                         int(12) NOT NULL,
    `DeliverFromPlant`                         varchar(4) NOT NULL,
    `ProductionPlantBusinessPartner`           int(12) NOT NULL,
    `ProductionPlant`                          varchar(4) NOT NULL,
    `MRPArea`                                  varchar(10) DEFAULT NULL,
    `MRPController`                            varchar(3) DEFAULT NULL,
    `ProductionVersion`                        int(16) DEFAULT NULL,
    `ProductionVersionItem`                    int(6) DEFAULT NULL,
    `Sequence`                                 int(4) NOT NULL,
    `SequenceText`                             varchar(200) DEFAULT NULL,
    `OperationText`                            varchar(200) NOT NULL,
    `ProductBaseUnit`                          varchar(3) NOT NULL,
    `ProductProductionUnit`					   varchar(3) NOT NULL,
    `ProductOperationUnit`                     varchar(3) NOT NULL,
    `ProductDeliveryUnit`                      varchar(3) NOT NULL,
    `StandardLotSizeQuantity`                  float(15) NOT NULL,
    `MinimumLotSizeQuantity`                   float(15) NOT NULL,
    `MaximumLotSizeQuantity`                   float(15) NOT NULL,
    `OperationPlannedQuantityInBaseUnit`       float(15) NOT NULL,
    `OperationPlannedQuantityInProductionUnit` float(15) NOT NULL,
    `OperationPlannedQuantityInOperationUnit`  float(15) NOT NULL,
    `OperationPlannedQuantityInDeliveryUnit`   float(15) NOT NULL,
    `OperationPlannedScrapInPercent`           float(7) DEFAULT NULL,
    `ResponsiblePlannerGroup`                  varchar(3) DEFAULT NULL,
    `PlainLongText`                            varchar(1000) DEFAULT NULL,
    `WorkCenter`                               int(16) NOT NULL,
    `CapacityCategory`                         varchar(20) DEFAULT NULL,
    `OperationCostingRelevancyType`            varchar(1) DEFAULT NULL,
    `OperationSetupType`                       varchar(2) DEFAULT NULL,
    `OperationSetupGroupCategory`              varchar(10) DEFAULT NULL,
    `OperationSetupGroup`                      varchar(10) DEFAULT NULL,
    `MaximumWaitDuration`                      float(11) DEFAULT NULL,
    `StandardWaitDuration`                     float(11) DEFAULT NULL,
    `MinimumWaitDuration`                      float(11) DEFAULT NULL,
    `WaitDurationUnit`                         varchar(3) DEFAULT NULL,
    `MaximumQueueDuration`                     float(11) DEFAULT NULL,
    `StandardQueueDuration`                    float(11) DEFAULT NULL,
    `MinimumQueueDuration`                     float(11) DEFAULT NULL,
    `QueueDurationUnit`                        varchar(3) DEFAULT NULL,
    `MaximumMoveDuration`                      float(11) DEFAULT NULL,
    `StandardMoveDuration`                     float(11) DEFAULT NULL,
    `MinimumMoveDuration`                      float(11) DEFAULT NULL,
    `MoveDurationUnit`                         varchar(3) DEFAULT NULL,
    `StandardDeliveryDuration`                 float(11) DEFAULT NULL,
    `StandardDeliveryDurationUnit`             varchar(3) DEFAULT NULL,
    `CostElement`                              varchar(10) DEFAULT NULL,
    `PlannedOrderIsReleased`                   tinyint(1) DEFAULT NULL,
    `CreationDate`	                           date NOT NULL,
    `CreationTime`                             time NOT NULL,
    `LastChangeDate`	                       date NOT NULL,
    `LastChangeTime`                           time NOT NULL,
    `IsMarkedForDeletion`                      tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`PlannedOrder`, `PlannedOrderItem`, `Operations`, `OperationsItem`, `OperationID`),

    CONSTRAINT `DPFMPlannedOrderItemOperationData_fk` FOREIGN KEY (`PlannedOrder`, `PlannedOrderItem`) REFERENCES `data_platform_planned_order_item_data` (`PlannedOrder`, `PlannedOrderItem`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`) REFERENCES `data_platform_scr_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    -- CONSTRAINT `DPFMPlannedOrderItemOperationDataSCRDeliveryPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`) REFERENCES `data_platform_scr_delivery_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`),  テーブルなし
	-- CONSTRAINT `DPFMPlannedOrderItemOperationDataSCRProductionPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`) REFERENCES `data_platform_scr_production_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipProductionPlantID`, `Buyer`, `Seller`, `ProductionPlantBusinessPartner`, `ProductionPlant`, `Product`),　　テーブルなし
    CONSTRAINT `DPFMPlannedOrderItemOperationDataProductionVersionItem_fk` FOREIGN KEY (`ProductionVersion`, `ProductionVersionItem`) REFERENCES `data_platform_production_version_item_data` (`ProductionVersion`, `ProductionVersionItem`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataProductBaseUnit_fk` FOREIGN KEY (`ProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataProductProductionUnit_fk` FOREIGN KEY (`ProductProductionUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataProductOperationUnit_fk` FOREIGN KEY (`ProductOperationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataProductDeliveryUnit_fk` FOREIGN KEY (`ProductDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataWorkCenter_fk` FOREIGN KEY (`WorkCenter`) REFERENCES `data_platform_work_center_general_data` (`WorkCenter`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataWaitDurationUnit_fk` FOREIGN KEY (`WaitDurationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataQueueDurationUnit_fk` FOREIGN KEY (`QueueDurationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataMoveDurationUnit_fk` FOREIGN KEY (`MoveDurationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMPlannedOrderItemOperationDataStandardDeliveryDurationUnit_fk` FOREIGN KEY (`StandardDeliveryDurationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
