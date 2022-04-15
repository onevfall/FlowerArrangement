//
//  SCNLineNode.swift
//  SCNLine
//
//  Created by Max Cobb on 1/23/19.
//  Copyright © 2019 Max Cobb. All rights reserved.
//

import SceneKit

public class SCNLineNode: SCNNode {
  private var vertices = [SCNVector3]() //顶点
  public private(set) var length: CGFloat = 0 //长度
  public private(set) var points: [SCNVector3] {  //点
    didSet {
      self.update()
    }
  }
  public var radius: Float {  //线半径
    didSet {
      self.update()
    }
  }
  public var edges: Int { //围绕管状线的边缘使用的顶点数，将在整个几何图形中延伸
    didSet {
      self.update()
    }
  }
  public var lineMaterials = [SCNMaterial()]  //材质？？
  public var maxTurning: Int {  //线转向新方向时构成曲线外观的最大点数
    didSet {
      self.update()
    }
  }
    
  public private(set) var gParts: GeometryParts?

  /// Initialiser for a SCNLineNode
  ///
  /// - Parameters:
  ///   - points: array of points to be joined up to form the line
  ///   - radius: radius of the line
  ///   - edges: number of edges around the line/tube at every point
  ///   - maxTurning: multiplier to dictate how smooth the turns should be
  public init(with points: [SCNVector3] = [], radius: Float = 1, edges: Int = 12, maxTurning: Int = 4) {
    self.points = points
    self.radius = radius
    self.edges = edges
    self.maxTurning = maxTurning
    super.init()
    if !points.isEmpty {
      let (geomParts, len) = SCNGeometry.getAllLineParts(
        points: points, radius: radius,
        edges: edges, maxTurning: maxTurning
      )
      self.gParts = geomParts
      self.geometry = geomParts.buildGeometry()
      self.length = len
    }
  }

  /// Add a point to the collection for this SCNLineNode
  ///
  /// - Parameter point: point to be added to the line
  public func add(point: SCNVector3) {
    // TODO: optimise this function to not recalculate all points
    self.add(points: [point])
  }

  /// Add a point to the collection for this SCNLineNode
  ///
  /// - Parameter points: points to be added to the line
  public func add(points: [SCNVector3]) {
    // TODO: optimise this function to not recalculate all points
    self.points.append(contentsOf: points)
      
  }
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func update() {
    if points.count > 1 {
      let (geomParts, len) = SCNGeometry.getAllLineParts(
        points: points, radius: radius,
        edges: edges, maxTurning: maxTurning
      )
      self.gParts = geomParts
      self.geometry = geomParts.buildGeometry()
      self.geometry?.materials = self.lineMaterials
      self.length = len
    } else {
      self.geometry = nil
      self.length = 0
    }
  }

  private func getlastAverages() -> SCNVector3 {
    let len = self.gParts!.vertices.count - 1
    let lastPoints = self.gParts?.vertices[(len - self.edges * 4)...(len - self.edges * 2)]
    let avg = lastPoints!.reduce(SCNVector3Zero, { (total, npoint) -> SCNVector3 in
      return total + npoint
    }) / Float(self.edges * 2)
    return avg
  }
}
