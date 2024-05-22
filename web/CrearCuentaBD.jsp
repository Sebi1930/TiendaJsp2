<script>const mysql = require('mysql');

const cn = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'bdcenter',
    port: '3306'
});

cn.connect((err) => {
    if (err) {
        console.error('Error al conectar: ' + err.stack);
        return;
    }
    console.log('Conexión establecida');
});

if (process.method === 'POST' && process.argv[2] === 'CrearCuenta') {
    const nombre = process.argv[3];
    const apellido = process.argv[4];
    const correo = process.argv[5];
    const Ntelefono = process.argv[6];
    const contraseña = process.argv[7];

    if (!nombre || !apellido || !correo || !Ntelefono || !contraseña) {
        // Manejo de campos vacíos
    } else {
        const checkEmailQuery = "SELECT COUNT(*) as contar FROM registrocuenta WHERE Correo = ?";
        cn.query(checkEmailQuery, [correo], (err, results) => {
            if (err) {
                console.error('Error al ejecutar consulta: ' + err.stack);
                return;
            }
            const contar = results[0].contar;

            if (contar > 0) {
                console.log('La cuenta ya está creada');
            } else {
                const insertQuery = "INSERT INTO registrocuenta (Nombre, Apellido, Correo, Telefono, Contraseña) VALUES (?, ?, ?, ?, ?)";
                cn.query(insertQuery, [nombre, apellido, correo, Ntelefono, contraseña], (err, results) => {
                    if (err) {
                        console.error('Error al insertar datos: ' + err.stack);
                        return;
                    }

                    if (Ntelefono.length === 9 && !isNaN(Ntelefono)) {
                        console.log('Registro exitoso');
                    } else {
                        console.log('El número de teléfono debe tener exactamente 9 dígitos');
                    }
                });
            }
        });
    }
}

cn.end((err) => {
    if (err) {
        console.error('Error al cerrar la conexión: ' + err.stack);
        return;
    }
    console.log('Conexión cerrada');
});

</script>