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
    console.log('Conexi�n establecida');
});

if (process.method === 'POST' && process.argv[2] === 'CrearCuenta') {
    const nombre = process.argv[3];
    const apellido = process.argv[4];
    const correo = process.argv[5];
    const Ntelefono = process.argv[6];
    const contrase�a = process.argv[7];

    if (!nombre || !apellido || !correo || !Ntelefono || !contrase�a) {
        // Manejo de campos vac�os
    } else {
        const checkEmailQuery = "SELECT COUNT(*) as contar FROM registrocuenta WHERE Correo = ?";
        cn.query(checkEmailQuery, [correo], (err, results) => {
            if (err) {
                console.error('Error al ejecutar consulta: ' + err.stack);
                return;
            }
            const contar = results[0].contar;

            if (contar > 0) {
                console.log('La cuenta ya est� creada');
            } else {
                const insertQuery = "INSERT INTO registrocuenta (Nombre, Apellido, Correo, Telefono, Contrase�a) VALUES (?, ?, ?, ?, ?)";
                cn.query(insertQuery, [nombre, apellido, correo, Ntelefono, contrase�a], (err, results) => {
                    if (err) {
                        console.error('Error al insertar datos: ' + err.stack);
                        return;
                    }

                    if (Ntelefono.length === 9 && !isNaN(Ntelefono)) {
                        console.log('Registro exitoso');
                    } else {
                        console.log('El n�mero de tel�fono debe tener exactamente 9 d�gitos');
                    }
                });
            }
        });
    }
}

cn.end((err) => {
    if (err) {
        console.error('Error al cerrar la conexi�n: ' + err.stack);
        return;
    }
    console.log('Conexi�n cerrada');
});

</script>