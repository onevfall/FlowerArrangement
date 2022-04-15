//
//  SCNVector3+Extensions.swift
//  SCNPath
//
//  Created by Max Cobb on 12/10/18.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import SceneKit

internal extension SCNVector3 {

  /**
   * Returns the length (magnitude) of the vector described by the SCNVector3
   */
  var length: Float {
    return sqrtf(self.lenSq)
  }

  //用点积求向量之间夹角
  func angleChange(to: SCNVector3) -> Float {
    let dot = self.normalized().dot(vector:  to.normalized())
    return acos(dot / sqrt(self.lenSq * to.lenSq))
  }

  /**
   * Returns the squared length (magnitude) of the vector described by the SCNVector3
   */
  var lenSq: Float {
    return x*x + y*y + z*z
  }

  /**
   * Normalizes the vector described by the SCNVector3 to length 1.0 and returns
   * the result as a new SCNVector3.
   */
  func normalized() -> SCNVector3 {
    return self / self.length
  }

  /**
   * Calculates the distance between two SCNVector3. Pythagoras!
   */
  func distance(vector: SCNVector3) -> Float {
    return (self - vector).length
  }

  /**
   * Calculates the dot product （点积）between two SCNVector3.
   */
  func dot(vector: SCNVector3) -> Float {
    return x * vector.x + y * vector.y + z * vector.z
  }

  /**
   * Calculates the cross product（叉积） between two SCNVector3.
   */
  //叉积是垂直a、b所在平面，且以|b|·sinθ为高、|a|为底的平行四边形的面积
  func cross(vector: SCNVector3) -> SCNVector3 {
    return SCNVector3(y * vector.z - z * vector.y, z * vector.x - x * vector.z, x * vector.y - y * vector.x)
  }
    
    //平整 把3维点转换为二维（y=0）
  func flattened() -> SCNVector3 {
    return SCNVector3(self.x, 0, self.z)
  }

  /// Given a point and origin, rotate along X/Z plane by radian amount 给定一个点和原点，沿X/Z平面（即y的值不变）旋转弧度
  ///
  /// - parameter origin: Origin for the start point to be rotated about
  /// - parameter by: Value in radians for the point to be rotated by 要旋转的点的弧度值
  ///
  /// - returns: New SCNVector3 that has the rotation applied
  func rotate(about origin: SCNVector3, by: Float) -> SCNVector3 {
    let pointRepositionedXY = [self.x - origin.x, self.z - origin.z]
    let sinAngle = sin(by)
    let cosAngle = cos(by)
    return SCNVector3(
      x: pointRepositionedXY[0] * cosAngle - pointRepositionedXY[1] * sinAngle + origin.x,
      y: self.y,
      z: pointRepositionedXY[0] * sinAngle + pointRepositionedXY[1] * cosAngle + origin.z
    )
  }
}

/**
 * Adds two SCNVector3 vectors and returns the result as a new SCNVector3.
 */
internal func + (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
  return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
internal func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

/**
 * Subtracts two SCNVector3 vectors and returns the result as a new SCNVector3.
 */
internal func - (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
  return SCNVector3Make(left.x - right.x, left.y - right.y, left.z - right.z)
}

/**
 * Multiplies the x, y and z fields of a SCNVector3 with the same scalar value and
 * returns the result as a new SCNVector3.
 */
internal func * (vector: SCNVector3, scalar: Float) -> SCNVector3 {
  return SCNVector3Make(vector.x * scalar, vector.y * scalar, vector.z * scalar)
}

/**
 * Multiplies the x and y fields of a SCNVector3 with the same scalar value.
 */
internal func *= (vector: inout SCNVector3, scalar: Float) {
  vector = (vector * scalar)
}

/**
 * Divides two SCNVector3 vectors abd returns the result as a new SCNVector3
 */
internal func / (left: SCNVector3, right: SCNVector3) -> SCNVector3 {
  return SCNVector3Make(left.x / right.x, left.y / right.y, left.z / right.z)
}

/**
 * Divides the x, y and z fields of a SCNVector3 by the same scalar value and
 * returns the result as a new SCNVector3.
 */
internal func / (vector: SCNVector3, scalar: Float) -> SCNVector3 {
  return SCNVector3Make(vector.x / scalar, vector.y / scalar, vector.z / scalar)
}
