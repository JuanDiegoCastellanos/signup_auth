-- Crear la tabla de usuarios
CREATE TABLE usuarios (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    password VARCHAR(255),
    email VARCHAR(100) UNIQUE
);

-- Crear la tabla de productos
CREATE TABLE productos (
    product_id INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2),
    dueño_id INT,
    comprador_id INT,
    FOREIGN KEY (dueño_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (comprador_id) REFERENCES usuarios(user_id)
);
-- 	migrate -path ./db/migration -database "postgresql://root:manolo221212@localhost:5434/simple_store?sslmode=disable" -verbose up
-- 	migrate -path ./db/migration -database "postgresql://root:manolo221212@localhost:5434/simple_store?sslmode=disable" -verbose down
