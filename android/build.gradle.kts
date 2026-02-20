allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)// 1️⃣ Repositories for all subprojects
subprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 2️⃣ Redirect root and subproject build directories
rootProject.buildDir = File(rootDir, "../../build")

subprojects {
    buildDir = File(rootProject.buildDir, project.name)
    this.evaluationDependsOn(":app")
}

// 3️⃣ Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}


subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
