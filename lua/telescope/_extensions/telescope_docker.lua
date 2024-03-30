local telescope_docker = require('telescope_docker')

return require('telescope').register_extension({
    exports = {
        docker_images = telescope_docker.docker_images,
        docker_ps = telescope_docker.docker_ps,
        docker_volumes = telescope_docker.docker_volumes,
    },
})
