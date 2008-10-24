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
	javac BuildInfo.java
	javac SelfViewer.java

$(Utils): Utils.java
	javac Utils.java

$(Viewer): Viewer.java $(Utils) $(Structure)
	javac Viewer.java

$(Structure): Structure.java $(Utils)
	javac Structure.java

$(RadarViewer): RadarViewer.java $(Utils) $(Structure)
	javac RadarViewer.java

$(LensRadarViewer): LensRadarViewer.java $(Utils) $(Structure)
	javac LensRadarViewer.java

$(CutoutBrowser): CutoutBrowser.java $(Structure) $(Utils)
	javac CutoutBrowser.java

$(SelfDisconnectButton): SelfDisconnectButton.java $(SelfViewer)
	javac SelfDisconnectButton.java
