## Little Lemon ER Diagram (Recreated)

```mermaid
erDiagram
    CUSTOMER_DETAILS ||--o{ BOOKINGS : makes
    CUSTOMER_DETAILS ||--o{ ORDERS : places
    STAFF_INFORMATION ||--o{ BOOKINGS : handles
    MENU ||--o{ ORDERS : contains
    MENUITEMS ||--o{ ORDERS : includes
    ORDERS ||--o{ ORDER_DELIVERY_STATUS : tracks

    CUSTOMER_DETAILS {
        int customerid PK
        string firstname
        string lastname
        string address
        string phonenumber
    }

    STAFF_INFORMATION {
        int staffid PK
        string firstname
        string lastname
        string role
        int salary
    }

    BOOKINGS {
        int bookingid PK
        date date
        int tablenumber
        int customerid FK
        int orderid FK
        int staffid FK
    }

    ORDERS {
        int orderid PK
        date date
        int quantity
        string ordertype
        decimal totalcost
        int menuid FK
        int menuitemid FK
        int customerid FK
    }

    MENU {
        int menuid PK
        string cuisines
        string starters
        string courses
        string drinks
        string desserts
        int menuitemid
    }

    MENUITEMS {
        int menuitemid PK
        string itemname
        decimal itemprice
    }

    ORDER_DELIVERY_STATUS {
        int orderdeliveryid PK
        date deliverydate
        string status
        int orderid FK
    }
