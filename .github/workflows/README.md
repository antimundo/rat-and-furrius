# How to configure this in your repo

If you want to copy this CI config to your repo, you need to follow these steps:

1. Copy `.github/workflow/main.yml` to your GitHub repository.
2. Change the value of [these variables](https://github.com/antimundo/rat-and-furrius/blob/main/.github/workflows/main.yml#L5-L8). If you update Godot's version, please remember to update the [Docker image's version](https://github.com/antimundo/rat-and-furrius/blob/main/.github/workflows/main.yml#L15) as well. You can see the available versions [here](https://hub.docker.com/r/barichello/godot-ci/tags).
3. Generate an [Itch API Key](https://itch.io/user/settings/api-keys) and add it as a secret to the project (Settings > Secrets and variables > Repository secrets). Name it `BUTLER_API_KEY`.
4. Open the project in Godot and generat the export config for a Web project (Project > Export... > Add... > Web). Keep "Web" as the export name and change the export path to `build/index.html`.

If you need a more detailed explanation, you can check [this blog post](https://blog.jnepo.dev/posts/ci-config-para-jams.html) (in spanish).

