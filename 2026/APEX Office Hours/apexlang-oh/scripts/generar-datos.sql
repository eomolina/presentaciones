-- Eliminar datos existentes
DELETE FROM stream_alquileres;
DELETE FROM stream_pelicula_actor;
DELETE FROM stream_peliculas;
DELETE FROM stream_actores;
DELETE FROM stream_clientes;
DELETE FROM stream_generos;

COMMIT;

-- Crear generos de peículas
INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Acción', 'Películas con ritmo intenso, aventuras y secuencias de acción');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Aventura', 'Historias de exploración, viajes y descubrimientos');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Ciencia ficción', 'Historias basadas en tecnología, futuro y mundos imaginarios');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Comedia', 'Películas orientadas al humor y entretenimiento');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Drama', 'Historias centradas en conflictos humanos y emocionales');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Terror', 'Películas de suspenso, miedo y fenómenos sobrenaturales');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Suspenso', 'Historias de tensión, misterio e incertidumbre');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Romance', 'Historias centradas en relaciones sentimentales');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Animación', 'Películas creadas mediante técnicas de animación');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Documental', 'Producciones basadas en hechos, personas o situaciones reales');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Fantasía', 'Historias con mundos imaginarios y elementos sobrenaturales');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Crimen', 'Historias relacionadas con delitos e investigaciones');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Histórica', 'Películas ambientadas en acontecimientos o períodos históricos');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Musical', 'Películas donde la música y las interpretaciones musicales son centrales');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Familia', 'Contenido orientado al entretenimiento familiar');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Deportes', 'Historias relacionadas con actividades y competencias deportivas');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Guerra', 'Películas ambientadas en conflictos bélicos');

INSERT INTO stream_generos (nombre, descripcion)
VALUES ('Misterio', 'Historias centradas en enigmas e investigaciones');

COMMIT;

-- Generar actores de manera aleatoria a partir de listas predefinidas

DECLARE
    TYPE t_lista IS TABLE OF VARCHAR2(100);

    l_nombres t_lista := t_lista(
        'Alejandro','Daniel','Carlos','Miguel','Andrés',
        'Javier','Fernando','Roberto','Diego','Ricardo',
        'Laura','María','Sofía','Ana','Elena',
        'Valentina','Gabriela','Carolina','Isabella','Natalia',
        'James','John','Michael','David','Robert',
        'Emma','Olivia','Charlotte','Amelia','Sophia'
    );

    l_apellidos t_lista := t_lista(
        'García','Rodríguez','Martínez','López','González',
        'Hernández','Pérez','Sánchez','Ramírez','Torres',
        'Johnson','Smith','Williams','Brown','Jones',
        'Miller','Davis','Wilson','Taylor','Anderson'
    );

    l_paises t_lista := t_lista(
        'Estados Unidos',
        'México',
        'España',
        'Argentina',
        'Colombia',
        'Costa Rica',
        'Brasil',
        'Chile',
        'Canadá',
        'Reino Unido',
        'Francia',
        'Italia',
        'Japón',
        'Corea del Sur',
        'Australia'
    );

    l_nombre       VARCHAR2(100);
    l_apellido     VARCHAR2(100);
    l_nacionalidad VARCHAR2(100);

BEGIN

    FOR i IN 1 .. 150 LOOP

        l_nombre := l_nombres(TRUNC(DBMS_RANDOM.VALUE(
            1,
            l_nombres.COUNT + 1
        )));

        l_apellido := l_apellidos(TRUNC(DBMS_RANDOM.VALUE(
            1,
            l_apellidos.COUNT + 1
        )));

        l_nacionalidad := l_paises(TRUNC(DBMS_RANDOM.VALUE(
            1,
            l_paises.COUNT + 1
        )));

        INSERT INTO stream_actores (
            nombre,
            apellido,
            fecha_nacimiento,
            nacionalidad
        )
        VALUES (
            l_nombre,
            l_apellido,
            DATE '1955-01-01'
                + TRUNC(DBMS_RANDOM.VALUE(0, 45 * 365)),
            l_nacionalidad
        );

    END LOOP;

    COMMIT;

END;
/

-- Generar títulos de películas de manera aleatoria

DECLARE

    TYPE t_lista IS TABLE OF VARCHAR2(100);

    l_prefijos t_lista := t_lista(
        'La última',
        'El secreto de',
        'Sombras sobre',
        'Regreso a',
        'El código de',
        'Misión',
        'Crónicas de',
        'El destino de',
        'Más allá de',
        'Guardianes de',
        'La leyenda de',
        'Noche en',
        'El misterio de',
        'Camino hacia',
        'Escape de',
        'El último',
        'Voces de',
        'Horizonte',
        'Destino',
        'Ecos de'
    );

    l_sustantivos t_lista := t_lista(
        'Titanio',
        'Orión',
        'la Ciudad Perdida',
        'las Estrellas',
        'Medianoche',
        'la Frontera',
        'Marte',
        'Neptuno',
        'la Isla',
        'las Sombras',
        'la Memoria',
        'la Tormenta',
        'Cristal',
        'Fuego',
        'Acero',
        'la Luna',
        'la Tierra',
        'los Sueños',
        'la Libertad',
        'la Verdad'
    );

    l_paises t_lista := t_lista(
        'Estados Unidos',
        'México',
        'España',
        'Argentina',
        'Colombia',
        'Costa Rica',
        'Brasil',
        'Chile',
        'Canadá',
        'Reino Unido',
        'Francia',
        'Japón'
    );

    l_idiomas t_lista := t_lista(
        'Español',
        'Inglés',
        'Portugués',
        'Francés',
        'Japonés',
        'Coreano'
    );

    l_clasificaciones t_lista := t_lista(
        'G',
        'PG',
        'PG-13',
        'R',
        'NC-17',
        'NR'
    );

    l_genero_id     NUMBER;
    l_titulo        VARCHAR2(200);
    l_clasificacion VARCHAR2(10);
    l_pais_origen   VARCHAR2(100);
    l_idioma        VARCHAR2(60);

BEGIN

    FOR i IN 1 .. 120 LOOP

        /*
         * Distribución no uniforme de géneros.
         * Esto ayuda a generar gráficos más interesantes.
         */
        IF i <= 25 THEN
            SELECT genero_id
            INTO l_genero_id
            FROM (
                SELECT genero_id
                FROM stream_generos
                WHERE nombre IN ('Acción','Ciencia ficción','Aventura')
                ORDER BY DBMS_RANDOM.VALUE
            )
            WHERE ROWNUM = 1;

        ELSIF i <= 50 THEN
            SELECT genero_id
            INTO l_genero_id
            FROM (
                SELECT genero_id
                FROM stream_generos
                WHERE nombre IN ('Drama','Comedia','Romance')
                ORDER BY DBMS_RANDOM.VALUE
            )
            WHERE ROWNUM = 1;

        ELSE
            SELECT genero_id
            INTO l_genero_id
            FROM (
                SELECT genero_id
                FROM stream_generos
                ORDER BY DBMS_RANDOM.VALUE
            )
            WHERE ROWNUM = 1;
        END IF;

        l_titulo :=
            l_prefijos(TRUNC(DBMS_RANDOM.VALUE(
                1,
                l_prefijos.COUNT + 1
            )))
            || ' '
            ||
            l_sustantivos(TRUNC(DBMS_RANDOM.VALUE(
                1,
                l_sustantivos.COUNT + 1
            )))
            || ' ' || i;

        l_clasificacion := l_clasificaciones(TRUNC(DBMS_RANDOM.VALUE(
            1,
            l_clasificaciones.COUNT + 1
        )));

        l_pais_origen := l_paises(TRUNC(DBMS_RANDOM.VALUE(
            1,
            l_paises.COUNT + 1
        )));

        l_idioma := l_idiomas(TRUNC(DBMS_RANDOM.VALUE(
            1,
            l_idiomas.COUNT + 1
        )));

        INSERT INTO stream_peliculas (
            titulo,
            descripcion,
            genero_id,
            anio,
            duracion_minutos,
            clasificacion,
            pais_origen,
            fecha_estreno,
            idioma,
            rating,
            activo
        )
        VALUES (
            l_titulo,

            'Descripción de demostración para la película '
            || l_titulo
            || '. Producción creada para el laboratorio APEXlang.',

            l_genero_id,

            TRUNC(DBMS_RANDOM.VALUE(1995, 2027)),

            TRUNC(DBMS_RANDOM.VALUE(80, 190)),

            l_clasificacion,

            l_pais_origen,

            DATE '1995-01-01'
                + TRUNC(DBMS_RANDOM.VALUE(
                    0,
                    DATE '2026-06-30' - DATE '1995-01-01'
                )),

            l_idioma,

            ROUND(DBMS_RANDOM.VALUE(4.5, 9.9), 1),

            CASE
                WHEN DBMS_RANDOM.VALUE < 0.92 THEN 'S'
                ELSE 'N'
            END
        );

    END LOOP;

    COMMIT;

END;
/

-- Genera relación entre películas y actores de manera aleatoria

DECLARE

    TYPE t_ids IS TABLE OF NUMBER;

    l_actores       t_ids;
    l_cantidad      NUMBER;
    l_actor_id      NUMBER;
    l_existe        NUMBER;

BEGIN

    FOR p IN (
        SELECT pelicula_id
        FROM stream_peliculas
    ) LOOP

        l_cantidad := TRUNC(DBMS_RANDOM.VALUE(3, 6));

        FOR i IN 1 .. l_cantidad LOOP

            LOOP

                SELECT actor_id
                INTO l_actor_id
                FROM (
                    SELECT actor_id
                    FROM stream_actores
                    ORDER BY DBMS_RANDOM.VALUE
                )
                WHERE ROWNUM = 1;

                SELECT COUNT(*)
                INTO l_existe
                FROM stream_pelicula_actor
                WHERE pelicula_id = p.pelicula_id
                  AND actor_id = l_actor_id;

                EXIT WHEN l_existe = 0;

            END LOOP;

            INSERT INTO stream_pelicula_actor (
                pelicula_id,
                actor_id,
                personaje
            )
            VALUES (
                p.pelicula_id,
                l_actor_id,
                'Personaje ' || i
            );

        END LOOP;

    END LOOP;

    COMMIT;

END;
/

-- Generar clientes de manera aleatoria

DECLARE

    TYPE t_lista IS TABLE OF VARCHAR2(100);

    l_nombres_m t_lista := t_lista(
        'Carlos','Daniel','Miguel','Andrés','Javier',
        'Fernando','Roberto','Diego','Ricardo','Luis',
        'José','Manuel','Pedro','Marco','David'
    );

    l_nombres_f t_lista := t_lista(
        'María','Sofía','Ana','Laura','Elena',
        'Valentina','Gabriela','Carolina','Isabella','Natalia',
        'Paula','Andrea','Lucía','Daniela','Camila'
    );

    l_apellidos t_lista := t_lista(
        'García','Rodríguez','Martínez','López','González',
        'Hernández','Pérez','Sánchez','Ramírez','Torres',
        'Vargas','Molina','Jiménez','Castro','Rojas'
    );

    l_genero VARCHAR2(1);
    l_nombre VARCHAR2(100);
    l_apellido VARCHAR2(100);
    l_pais VARCHAR2(100);
    l_ciudad VARCHAR2(100);

BEGIN

    FOR i IN 1 .. 1000 LOOP

        IF DBMS_RANDOM.VALUE < 0.50 THEN

            l_genero := 'M';

            l_nombre :=
                l_nombres_m(TRUNC(DBMS_RANDOM.VALUE(
                    1,
                    l_nombres_m.COUNT + 1
                )));

        ELSE

            l_genero := 'F';

            l_nombre :=
                l_nombres_f(TRUNC(DBMS_RANDOM.VALUE(
                    1,
                    l_nombres_f.COUNT + 1
                )));

        END IF;

        l_apellido :=
            l_apellidos(TRUNC(DBMS_RANDOM.VALUE(
                1,
                l_apellidos.COUNT + 1
            )));

        /*
         * Distribución deliberada para estadísticas.
         */
        CASE MOD(i, 10)

            WHEN 0 THEN
                l_pais := 'Costa Rica';

                l_ciudad :=
                    CASE MOD(i, 4)
                        WHEN 0 THEN 'San José'
                        WHEN 1 THEN 'Alajuela'
                        WHEN 2 THEN 'Heredia'
                        ELSE 'Cartago'
                    END;

            WHEN 1 THEN
                l_pais := 'México';
                l_ciudad :=
                    CASE MOD(i, 3)
                        WHEN 0 THEN 'Ciudad de México'
                        WHEN 1 THEN 'Guadalajara'
                        ELSE 'Monterrey'
                    END;

            WHEN 2 THEN
                l_pais := 'Colombia';
                l_ciudad :=
                    CASE MOD(i, 3)
                        WHEN 0 THEN 'Bogotá'
                        WHEN 1 THEN 'Medellín'
                        ELSE 'Cali'
                    END;

            WHEN 3 THEN
                l_pais := 'España';
                l_ciudad :=
                    CASE MOD(i, 3)
                        WHEN 0 THEN 'Madrid'
                        WHEN 1 THEN 'Barcelona'
                        ELSE 'Valencia'
                    END;

            WHEN 4 THEN
                l_pais := 'Argentina';
                l_ciudad := 'Buenos Aires';

            WHEN 5 THEN
                l_pais := 'Chile';
                l_ciudad := 'Santiago';

            WHEN 6 THEN
                l_pais := 'Brasil';
                l_ciudad :=
                    CASE MOD(i, 2)
                        WHEN 0 THEN 'São Paulo'
                        ELSE 'Rio de Janeiro'
                    END;

            WHEN 7 THEN
                l_pais := 'Perú';
                l_ciudad := 'Lima';

            WHEN 8 THEN
                l_pais := 'Estados Unidos';
                l_ciudad := 'Miami';

            ELSE
                l_pais := 'Canadá';
                l_ciudad := 'Toronto';

        END CASE;

        INSERT INTO stream_clientes (
            nombre,
            apellido,
            email,
            pais,
            ciudad,
            fecha_nacimiento,
            genero,
            fecha_registro,
            activo
        )
        VALUES (
            l_nombre,

            l_apellido,

            LOWER(
                REPLACE(l_nombre, ' ', '.')
                || '.'
                || REPLACE(l_apellido, ' ', '.')
                || i
                || '@demo-streaming.com'
            ),

            l_pais,

            l_ciudad,

            DATE '1955-01-01'
                + TRUNC(DBMS_RANDOM.VALUE(
                    0,
                    DATE '2008-12-31' - DATE '1955-01-01'
                )),

            l_genero,

            DATE '2022-01-01'
                + TRUNC(DBMS_RANDOM.VALUE(
                    0,
                    DATE '2026-06-30' - DATE '2022-01-01'
                )),

            CASE
                WHEN DBMS_RANDOM.VALUE < 0.94 THEN 'S'
                ELSE 'N'
            END
        );

    END LOOP;

    COMMIT;

END;
/

-- Genera datos de alquileres
-- Versión 19c

DECLARE

    l_cliente_id   NUMBER;
    l_pelicula_id  NUMBER;
    l_fecha        DATE;
    l_estado       VARCHAR2(20);
    l_precio       NUMBER;

BEGIN

    FOR i IN 1 .. 15000 LOOP

        /*
         * Seleccionar cliente activo.
         */
        SELECT cliente_id
        INTO l_cliente_id
        FROM (
            SELECT cliente_id
            FROM stream_clientes
            WHERE activo = 'S'
            ORDER BY DBMS_RANDOM.VALUE
        )
        WHERE ROWNUM = 1;


        /*
         * Seleccionar película.
         *
         * 60% de los alquileres se concentran
         * en las primeras 20 películas.
         */
        IF DBMS_RANDOM.VALUE < 0.60 THEN

            SELECT pelicula_id
            INTO l_pelicula_id
            FROM (
                SELECT pelicula_id
                FROM (
                    SELECT pelicula_id
                    FROM stream_peliculas
                    WHERE activo = 'S'
                    ORDER BY pelicula_id
                )
                WHERE ROWNUM <= 20
                ORDER BY DBMS_RANDOM.VALUE
            )
            WHERE ROWNUM = 1;

        ELSE

            SELECT pelicula_id
            INTO l_pelicula_id
            FROM (
                SELECT pelicula_id
                FROM stream_peliculas
                WHERE activo = 'S'
                ORDER BY DBMS_RANDOM.VALUE
            )
            WHERE ROWNUM = 1;

        END IF;


        /*
         * Fecha entre 2023 y la fecha actual.
         */
        l_fecha :=
            DATE '2023-01-01'
            + TRUNC(
                DBMS_RANDOM.VALUE(
                    0,
                    TRUNC(SYSDATE) - DATE '2023-01-01'
                )
            );


        /*
         * Estado.
         */
        IF l_fecha > TRUNC(SYSDATE) - 5 THEN

            l_estado := 'ACTIVO';

        ELSIF DBMS_RANDOM.VALUE < 0.03 THEN

            l_estado := 'CANCELADO';

        ELSE

            l_estado := 'FINALIZADO';

        END IF;


        /*
         * Precio.
         */
        CASE TRUNC(DBMS_RANDOM.VALUE(1, 11))

            WHEN 1 THEN l_precio := 2.99;
            WHEN 2 THEN l_precio := 2.99;

            WHEN 3 THEN l_precio := 4.99;
            WHEN 4 THEN l_precio := 4.99;
            WHEN 5 THEN l_precio := 4.99;
            WHEN 6 THEN l_precio := 4.99;
            WHEN 7 THEN l_precio := 4.99;

            WHEN 8 THEN l_precio := 6.99;
            WHEN 9 THEN l_precio := 6.99;

            ELSE l_precio := 9.99;

        END CASE;


        INSERT INTO stream_alquileres (
            cliente_id,
            pelicula_id,
            fecha_alquiler,
            fecha_vencimiento,
            fecha_devolucion,
            estado,
            precio
        )
        VALUES (
            l_cliente_id,
            l_pelicula_id,
            l_fecha,
            l_fecha + INTERVAL '3' DAY,

            CASE
                WHEN l_estado = 'FINALIZADO'
                THEN l_fecha + TRUNC(DBMS_RANDOM.VALUE(1, 4))
            END,

            l_estado,
            l_precio
        );


        IF MOD(i, 1000) = 0 THEN
            COMMIT;
        END IF;

    END LOOP;

    COMMIT;

END;
/

-- Verificar datos generados

SELECT 'GENEROS' tabla, COUNT(*) cantidad
FROM stream_generos

UNION ALL

SELECT 'ACTORES', COUNT(*)
FROM stream_actores

UNION ALL

SELECT 'PELICULAS', COUNT(*)
FROM stream_peliculas

UNION ALL

SELECT 'PELICULA_ACTOR', COUNT(*)
FROM stream_pelicula_actor

UNION ALL

SELECT 'CLIENTES', COUNT(*)
FROM stream_clientes

UNION ALL

SELECT 'ALQUILERES', COUNT(*)
FROM stream_alquileres;
