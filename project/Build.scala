import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {

  val appName         = "com_beligum_blingblocks"
  val appVersion      = "1.0-SNAPSHOT"

  val appDependencies = Seq(
  	javaCore,
    javaJdbc,
    javaEbean,
    "com.beligum" %% "com_beligum_cms" % "1.0-SNAPSHOT"
  )

  val main = play.Project(appName, appVersion, appDependencies).settings(
  	organization := "com.beligum",
    publishArtifact in(Compile, packageDoc) := false,
    sources in doc in Compile := List(),
    com.typesafe.sbteclipse.core.EclipsePlugin.EclipseKeys.skipParents in ThisBuild := false,
    com.typesafe.sbteclipse.core.EclipsePlugin.EclipseKeys.withSource := true,
    
    templatesImport ++= Seq("java.util._","com.beligum._","com.beligum.blingblocks._")
  )

}
