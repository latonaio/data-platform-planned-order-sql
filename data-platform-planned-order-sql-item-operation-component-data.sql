CREATE TABLE `data_platform_planned_order_item_operation_component_data`
(
    `PlannedOrder`                                               int(16) NOT NULL,
    `PlannedOrderItem`                                           int(6) NOT NULL,
    `Operations`                                                 int(16) NOT NULL,
    `OperationsItem`                                             int(6) NOT NULL,
    `OperationID`                                                int(4) NOT NULL,
    `BillOfMaterial`                                             int(16) NOT NULL,
    `BillOfMaterialItem`                                         int(6) NOT NULL,
    `SupplyChainRelationshipID`                                  int(16) NOT NULL,
    `SupplyChainRelationshipDeliveryID`                          int(6) NOT NULL,
    `SupplyChainRelationshipDeliveryPlantID`                     int(4) NOT NULL,
    `ProductionPlantBusinessPartner`                             int(12) NOT NULL,
    `ProductionPlant`                                            varchar(4) NOT NULL,
    `ComponentProduct`                                           varchar(40) NOT NULL,
    `ComponentProductBuyer`                                      int(12) NOT NULL,
    `ComponentProductSeller`                                     int(12) NOT NULL,
    `ComponentProductDeliverToParty`                             int(12) NOT NULL,
    `ComponentProductDeliverToPlant`                             varchar(4) NOT NULL,
    `ComponentProductDeliverFromParty`                           int(12) NOT NULL,
    `ComponentProductDeliverFromPlant`                           varchar(4) NOT NULL,
    `ComponentProductDeliverToPartyInOperation`                  int(12) NOT NULL,
    `ComponentProductDeliverToPlantInOperation`                  varchar(4) NOT NULL,
    `ComponentProductDeliverFromPartyInOperation`                int(12) NOT NULL,
    `ComponentProductDeliverFromPlantInOperation`                varchar(4) NOT NULL,
    `ComponentProductRequirementDateInOperation`                 date NOT NULL,
    `ComponentProductRequirementTimeInOperation`                 time NOT NULL,
    `ComponentProductPlannedQuantityInBaseUnitInOperation`       float(15) NOT NULL,
    `ComponentProductPlannedQuantityInDeliveryUnitInOperation`   float(15) NOT NULL,
    `ComponentProductPlannedScrapInPercentInOperation`           float(7) DEFAULT NULL,
    `ComponentProductBaseUnit`                                   varchar(3) NOT NULL,
    `ComponentProductDeliveryUnit`                               varchar(3) NOT NULL,
    `ComponentProductIsMarkedForBackflush`                       tinyint(1) DEFAULT NULL,
    `MRPArea`                                                    varchar(10) DEFAULT NULL,
    `MRPController`                                              varchar(3) DEFAULT NULL,
    `ProductionVersion`                                          int(16) DEFAULT NULL,
    `ProductionVersionItem`                                      int(6) DEFAULT NULL,
    `ComponentProductReservation`                                int(16) DEFAULT NULL,
    `ComponentProductReservationItem`                            int(4) DEFAULT NULL,
    `PlannedOrderIsReleased`                                	 tinyint(1) DEFAULT NULL,
    `CreationDate`	                                             date NOT NULL,
    `CreationTime`                                               time NOT NULL,
    `LastChangeDate`	                                         date NOT NULL,
    `LastChangeTime`                                             time NOT NULL,
    `IsMarkedForDeletion`                                        tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`PlannedOrder`, `PlannedOrderItem`, `Operations`, `OperationsItem`, `OperationID`, `BillOfMaterial`, `BillOfMaterialItem`),

    CONSTRAINT `DPFMPlannedOrderItemOperationComponentData_fk` FOREIGN KEY (`PlannedOrder`, `PlannedOrderItem`, `Operations`, `OperationsItem`, `OperationID`) REFERENCES `data_platform_planned_order_item_operation_data` (`PlannedOrder`, `PlannedOrderItem`, `Operations`, `OperationsItem`, `OperationID`),
    CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataBOMItem_fk` FOREIGN KEY (`PlannedOrder`, `PlannedOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_planned_order_item_component_data` (`PlannedOrder`, `PlannedOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`),
    CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `ComponentProductBuyer`, `ComponentProductSeller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataSCRDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `ComponentProductBuyer`, `ComponentProductSeller`, `ComponentProductDeliverToParty`, `ComponentProductDeliverFromParty`) REFERENCES `data_platform_scr_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    -- CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataSCRDeliveryPlantIDProduct_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `ComponentProductBuyer`, `ComponentProductSeller`, `ComponentProductDeliverToParty`, `ComponentProductDeliverFromParty`, `ComponentProductDeliverToPlant`, `ComponentProductDeliverFromPlant`, `ComponentProduct`) REFERENCES `data_platform_scr_delivery_plant_relation_product_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`, `Product`),　　too long
    -- CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataComponentProductBaseUnit_fk` FOREIGN KEY (`ComponentProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`), too long
    -- CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataComponentProductDeliveryUnit_fk` FOREIGN KEY (`ComponentProductDeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),  too long
    -- CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataProductionVersionItem_fk` FOREIGN KEY (`ProductionVersion`, `ProductionVersionItem`) REFERENCES `data_platform_production_version_item_data` (`ProductionVersion`, `ProductionVersionItem`), too long
    -- CONSTRAINT `DPFMPlannedOrderItemOperationComponentDataComponentProductReservationItem_fk` FOREIGN KEY (`ComponentProductReservation`, `ComponentProductReservationItem`) REFERENCES `data_platform_reservation_document_item_data` (`Reservation`, `ReservationItem`) too long

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
