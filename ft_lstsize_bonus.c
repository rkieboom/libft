/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_lstsize_bonus.c                                 :+:    :+:            */
/*                                                     +:+                    */
/*   By: rkieboom <rkieboom@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/13 14:24:31 by rkieboom       #+#    #+#                */
/*   Updated: 2019/11/29 08:46:20 by rkieboom      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_lstsize(t_list *lst)
{
	int result;

	result = 0;
	if (lst == NULL)
		return (0);
	while (lst)
	{
		result++;
		lst = lst->next;
	}
	return (result);
}
