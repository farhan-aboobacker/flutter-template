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

    # Create a new Flutter project in the output directory ($out)
    flutter create "$out" --org=${bundleid} --description=${appdesc} --platforms="web,android"
  
   
  '';
}
