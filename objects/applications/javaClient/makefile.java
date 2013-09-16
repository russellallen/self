########################################################################
# Makefile for the java browser.  Not totally foolproof
#
# $Revision: 30.1 $
#     Andy Collins, Sun Microsystems Laboratories, Summer 1996
########################################################################

SelfViewer = SelfViewer.class
Utils = SelfObjectState.class
Viewer = ViewerBrowserCore.class
Structure = BrowserPanel.class
RadarViewer = RadarViewerBrowserCore.class
LensRadarViewer = LensRadarViewerBrowserCore.class
CutoutBrowser = CutoutBrowserPanel.class
SelfDisconnectButton = SelfDisconnectButton.class

all: $(SelfViewer) $(SelfDisconnectButton)

$(SelfViewer): SelfViewer.java $(Utils) $(RadarViewer) $(Viewer) \
               $(LensRadarViewer) $(Structure) $(CutoutBrowser)
	./makedate
	javac -cp . BuildInfo.java
	javac -cp . SelfViewer.java

$(Utils): Utils.java
	javac -cp . Utils.java

$(Viewer): Viewer.java $(Utils) $(Structure)
	javac -cp . Viewer.java

$(Structure): Structure.java $(Utils)
	javac -cp . Structure.java

$(RadarViewer): RadarViewer.java $(Utils) $(Structure)
	javac -cp . RadarViewer.java

$(LensRadarViewer): LensRadarViewer.java $(Utils) $(Structure)
	javac -cp . LensRadarViewer.java

$(CutoutBrowser): CutoutBrowser.java $(Structure) $(Utils)
	javac -cp . CutoutBrowser.java

$(SelfDisconnectButton): SelfDisconnectButton.java $(SelfViewer)
	javac -cp . SelfDisconnectButton.java
