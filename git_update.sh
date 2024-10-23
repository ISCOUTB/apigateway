#!/bin/bash

# Colores para la salida en la terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # Sin color

# Obtener la fecha y hora actual
current_date=$(date '+%Y-%m-%d %H:%M:%S')

# Archivo HTML donde se guardará la información de docker ps y las operaciones
output_file="$HOME/apigateway/index.html"

# Crear el directorio si no existe
mkdir -p "$(dirname "$output_file")"

# Variables para almacenar las operaciones
operations_html=""

# Lista de directorios donde se ejecutará git pull
directories=(
    "/ag-projects/AG-AgricultureCompany"
    "/ag-projects/AG-Analysis-ICFES"
    "/ag-projects/AG-GestionHospitalaria"
    "/ag-projects/AG-Nebula"
    "/ag-projects/AG-Product-s-Tech"
    "/ag-projects/AG-StellarGather"
    "/ag-projects/AG-TalkHub"
    "/ag-projects/AG-WeatherWhisper"
    "/ah-projects/AH-CineManager"
    "/ah-projects/AH-MAPRICE2"
    "/ah-projects/AH-MetroEvent"
    "/ah-projects/AH-PETSADDOPT"
    "/ah-projects/AH-ProManage"
    "/ah-projects/AH-TaskManager"
    "/ah-projects/AH-ToolCheck"
    "/ah-projects/AH-YaperGoUTB"
)

# Recorremos cada directorio y ejecutamos git pull, docker compose build, docker compose up -d
for dir in "${directories[@]}"; do
    full_dir="$HOME$dir"
    if [ -d "$full_dir" ]; then
        echo -e "Entrando al directorio: $full_dir"
        cd "$full_dir" || { 
            echo -e "\n${RED}Error: No se pudo acceder al directorio $full_dir${NC}\n"
            operations_html+="
            <div class=\"alert alert-danger\" role=\"alert\">
                <strong>Error:</strong> No se pudo acceder al directorio <em>$full_dir</em>.
            </div>
            "
            continue 
        }

        # Ejecutar git pull
        echo -e "Ejecutando git pull en $full_dir..."
        if ! git pull > /dev/null 2>&1; then
            echo -e "\n${RED}Error: git pull falló en $full_dir${NC}\n"
            operations_html+="
            <div class=\"alert alert-danger\" role=\"alert\">
                <strong>Error:</strong> git pull falló en <em>$full_dir</em>.
            </div>
            "
            continue
        else
            echo -e "${GREEN}git pull exitoso en $full_dir${NC}"
        fi

        # Compilar Docker
        echo -e "Construyendo contenedores Docker en $full_dir..."
        if ! docker compose build > /dev/null 2>&1; then
            echo -e "\n${RED}Error: Docker build falló en $full_dir${NC}\n"
            operations_html+="
            <div class=\"alert alert-danger\" role=\"alert\">
                <strong>Error:</strong> Docker build falló en <em>$full_dir</em>.
            </div>
            "
            continue
        else
            echo -e "${GREEN}Docker build exitoso en $full_dir${NC}"
        fi

        # Levantar los contenedores
        echo -e "Iniciando contenedores Docker en $full_dir..."
        if ! docker compose up -d > /dev/null 2>&1; then
            echo -e "\n${RED}Error: Docker up falló en $full_dir${NC}\n"
            operations_html+="
            <div class=\"alert alert-danger\" role=\"alert\">
                <strong>Error:</strong> Docker up falló en <em>$full_dir</em>.
            </div>
            "
            continue
        else
            echo -e "${GREEN}Contenedores Docker iniciados exitosamente en $full_dir${NC}"
        fi

        # Mostrar éxito en el HTML
        operations_html+="
        <div class=\"alert alert-success\" role=\"alert\">
            <strong>Éxito:</strong> Operaciones completadas en <em>$full_dir</em>.
        </div>
        "
    else
        echo -e "\n${RED}Directorio no encontrado: $dir${NC}\n"
        operations_html+="
        <div class=\"alert alert-warning\" role=\"alert\">
            <strong>Advertencia:</strong> Directorio no encontrado: <em>$full_dir</em>.
        </div>
        "
    fi
done

# Ejecutar docker ps una sola vez al final
echo "Ejecutando docker ps para obtener el estado de los contenedores..."
docker_ps_output=$(docker ps --format "{{.ID}}|{{.Image}}|{{.Command}}|{{.CreatedAt}}|{{.Status}}|{{.Ports}}|{{.Names}}")

# Formatear la salida de docker ps como una tabla Bootstrap
docker_ps_table=$(echo "$docker_ps_output" | awk -F"|" '
BEGIN {
    print "<table class=\"table table-striped table-bordered table-sm mt-4\" style=\"font-size: 0.9rem;\">"
    print "<thead class=\"table-dark\"><tr><th>CONTAINER ID</th><th>IMAGE</th><th>COMMAND</th><th>CREATED</th><th>STATUS</th><th>PORTS</th><th>NAMES</th></tr></thead><tbody>"
}
{
    # Escapar caracteres especiales en HTML
    for(i=1;i<=NF;i++) {
        gsub(/&/, "&amp;", $i)
        gsub(/</, "&lt;", $i)
        gsub(/>/, "&gt;", $i)
        # Trim leading and trailing whitespace
        gsub(/^[ \t]+|[ \t]+$/, "", $i)
    }
    print "<tr>"
    for(i=1;i<=NF;i++) {
        printf "<td>%s</td>", $i
    }
    print "</tr>"
}
END {
    print "</tbody></table>"
}
')

# Crear el archivo HTML con la estructura básica y enlazar Bootstrap 5
cat <<EOF > "$output_file"
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Docker Status Report</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Enlace a Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Ajustar el tamaño de la fuente de la tabla */
        table {
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container my-5">
        <h1 class="mb-3">Docker Status Report</h1>
        <p class="text-muted">Reporte generado el: <strong>$current_date</strong></p>

        <section class="mb-5">
            <h2>Estado Global de Docker</h2>
            <div class="table-responsive">
                $docker_ps_table
            </div>
        </section>

        <hr>

        <section>
            <h2>Registro de Operaciones</h2>
            $operations_html
        </section>
    </div>
    <!-- Enlace a Bootstrap 5 JS y dependencias -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
EOF

# Mostrar mensaje al finalizar
echo "Reporte de estado de Docker generado en: $output_file"
