//
//  StatisticsViewController.swift
//  MaterialGathering
//
//  Created by T. Jimbo on 2018/07/26.
//  Copyright © 2018年 TakJim. All rights reserved.
//

import UIKit
import Charts

class StatisticsViewController: UIViewController {

    var barChartView: BarChartView!
    var test_data = [0.0, 0.0, 0.0, 0.0, 0.0]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        barChartView = BarChartView(frame: CGRect(x: 20, y: 75, width: self.view.frame.width - 40, height:self.view.frame.height - 150))
        
        setChart(y: test_data)
        
        self.view.addSubview(barChartView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart(y: [Double]){
        barChartView.chartDescription?.text = "testtesttest"
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        barChartView.xAxis.enabled = false
        
        var data = [BarChartDataEntry]()
        
        for (i, val) in y.enumerated() {
            let dataEntry = BarChartDataEntry(x: Double(i), y: val)
            data.append(dataEntry)
        }
        
        let DataSet = BarChartDataSet(values: data, label: "test_charts")
        barChartView.data = BarChartData(dataSet: DataSet)
        
        DataSet.colors = ChartColorTemplates.vordiplom()
        
    }
    
    @IBAction func continueButtonTapped(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
