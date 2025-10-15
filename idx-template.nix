{ pkgs, bundleid ? "com.example", appdesc ? "A new Flutter project.", ... }: {
  # List of packages to be available in the environment
  packages = [
    pkgs.git      # Git version control system
    pkgs.glibc    # GNU C Library, required by many binaries
    pkgs.which    # 'which' command to locate executables
  ];
 
  # Bootstrap script executed after the environment is built
  bootstrap = ''
    # Inform the user that the Flutter Firebase template setup is starting
    echo "🔧 Initializing Flutter Firebase Template..."

    # Create a hidden folder '.idx' inside the project for custom indexing or metadata
    mkdir "$out/.idx"
 
    # Create a new Flutter project in the output directory ($out)
    flutter create "$out" --org=${bundleid} --description=${appdesc} --platforms="web,android"
    
    # Copy development environment configuration file into the '.idx' folder
    cp ${./dev.nix} "$out/.idx/dev.nix"
    # Ensure all files in the project directory are writable by the user
    chmod -R u+w "$out"
  '';
}
