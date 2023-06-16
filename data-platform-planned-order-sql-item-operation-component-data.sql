CREATE TABLE `data_platform_planned_order_item_operation_component_data`
(
    `PlannedOrder`                             int(16) NOT NULL,
    `PlannedOrderItem`                         int(6) NOT NULL,
    `Operations`                               int(16) NOT NULL,
    `OperationsItem`                           int(6) NOT NULL,
    `OperationID`                              int(4) NOT NULL,
    `BillOfMaterial`                           int(16) NOT NULL,
    `BillOfMaterialItem`                       int(6) NOT NULL,
    `ValidityStartDate`                        date DEFAULT NULL,
    `ValidityEndDate`                          date DEFAULT NULL,
    `CreationDate`                             date NOT NULL,
    `LastChangeDate`                           date NOT NULL,
    `IsMarkedForDeletion`                      tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`PlannedOrder`, `PlannedOrderItem`, `Operations`, `OperationsItem`, `OperationID`, `BillOfMaterial`, `BillOfMaterialItem`),

    CONSTRAINT `DataPlatformPlannedOrderItemOperationComponentData_fk` FOREIGN KEY (`PlannedOrder`, `PlannedOrderItem`, `Operations`, `OperationsItem`, `OperationID`) REFERENCES `data_platform_planned_order_item_operation_data` (`PlannedOrder`, `PlannedOrderItem`, `Operations`, `OperationsItem`, `OperationID`),
    CONSTRAINT `DataPlatformPlannedOrderItemOperationComponentDataBOMItem_fk` FOREIGN KEY (`PlannedOrder`, `PlannedOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`) REFERENCES `data_platform_planned_order_item_component_data` (`PlannedOrder`, `PlannedOrderItem`, `BillOfMaterial`, `BillOfMaterialItem`)


) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
  