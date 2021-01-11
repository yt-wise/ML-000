
import pandas as pd
import numpy as np 
import func_01


if __name__ == '__main__':
	y = np.random.randint(2, size=(5000, 1))
	x = np.random.randint(10, size=(5000, 1))
	data = pd.DataFrame(np.concatenate([y, x], axis=1), columns=['y', 'x'])
	result = func_01.target_mean_v4_c(data.values)
	print("共有{}个数据，打印前10个数据：".format(len(result)))
	print(result[:10])